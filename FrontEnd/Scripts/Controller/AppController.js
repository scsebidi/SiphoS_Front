let app = angular.module("app", []);

app.controller("AppController", function ($scope) {
    $scope.GetStock = () => {
        Post("Stock.aspx?ajax=true&GetStock=true", null, (jqXHR, testStatus, errorThrown) => {
            alert(errorThrown);
        }, (result) => {
            $('#table_id tfoot th').each(function () {
                var title = $(this).text();
                $(this).html('<input type="text" placeholder="Search ' + title + '" />');
            });
            $("#table_id").DataTable({
                initComplete: function () {
                    this.api().columns().every(function () {
                        var that = this;
                        $('input', this.footer()).on('keyup change clear', function () {
                            if (that.search() !== this.value) {
                                that
                                    .search(this.value)
                                    .draw();
                            }
                        });
                    });
                },
                "ordering": true,
                "data": result,
                "searching": true,
                "scrollX": true,
                "columns": [
                    { 'data': 'VehicleRegistration', className: "centerText" },
                    { 'data': 'Make', className: "centerText" },
                    { 'data': 'Model', className: "centerText" },
                    { 'data': 'ModelYear', className: "centerText" },
                    { 'data': 'KMS', className: "centerText" },
                    { 'data': 'Colour', className: "centerText" },
                    { 'data': 'VIN', className: "centerText" },
                    { 'data': 'Retain', className: "centerText" },
                    { 'data': 'CostPrice', className: "centerText" },
                    { 'data': 'Description', className: "centerText" },
                    { 'data': 'Image', className: "centerText" },
                    { 'data': 'DTCreated', className: "centerText" },
                    { 'data': 'DTUpdated', className: "centerText" },
                ],
                'dom': 'Bfrtip',
                "select": "single",
                'destroy': true,
                "autoWidth": true,
                'buttons': [
                    'copyHtml5',
                    'excelHtml5',
                    'csvHtml5',
                    {
                        extend: 'pdfHtml5',
                        orientation: 'landscape',
                        pageSize: 'LEGAL'
                    },
                    {
                        text: 'Edit',
                        action: function (e, dt, node, config) {
                            ShowBusyIndicator();
                            var request = dt.rows({ selected: true }).data();
                            Post("Stock.aspx?ajax=true&EditStock=true?&id=" + request[0].id, request, (jqXHR, testStatus, errorThrown) => {
                                    HideBusyIndicator();
                                    alert(errorThrown);
                                }, function (result) {
                                    HideBusyIndicator();
                                    let responseText = CleanResponseText(result);                                   
                                });
                            }
                    },
                ],
                "defaultContent": "<button>Click!</button>"
            });
        });
    }
    $scope.Add = () => {
        let request = [{
            "vehicleRegistration": $scope.VehicleRegistration,
            "make": $scope.Make,
            "model": $scope.Model,
            "modelYear": $scope.ModelYear,
            "kms": $scope.KMS,
            "colour": $scope.Colour,
            "vin": $scope.VIN,
            "retailPrice": $scope.RetailPrice,
            "costPrice": $scope.CostPrice,
            "images": $scope.Image,
            "assesorry": $scope.Description,
        }]
        Post("Stock.aspx?ajax=true&AddStock=true?&",request, (jqXHR, testStatus, errorThrown) => {
            HideBusyIndicator();
            alert(errorThrown);
        }, function (result) {
            HideBusyIndicator();
            let responseText = CleanResponseText(result);
        });
    }
    $scope.GetStock();
});
Post = (url, data, OnError, OnComplete) => {
    var dataJson = JSON.stringify(data);
    $.ajax({
        url: url,
        type: "POST",
        data: dataJson,
        dataType: 'text',
        contentType: 'application/json; charset=utf-8',
        error: function (jqXHR, testStatus, errorThrown) {
            if (OnError) { OnError(jqXHR, testStatus, errorThrown); }
        },
        complete: function (result) {
            if (OnComplete) { OnComplete(result); }

        },
        timeout: 600000000
    });
}
function CleanResponseText(responseText) {
    responseText = responseText.split("<!DOCTYPE")[0];
    responseText = responseText.replace("\r\n", "");
    responseText = responseText.replace("\n", "");
    return responseText;
}
