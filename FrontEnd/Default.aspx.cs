using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd
{
    public partial class _Default : Page
    {
        private static string ApiUrl = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProcessRequest();
            ApiUrl = System.Configuration.ConfigurationManager.AppSettings["API"];

        }
        private void ProcessRequest()
        {
            if (Request.Params["GetStock"] != null) { GetStock(); }
            if (Request.Params["EditStock"] != null) { EditStock(); }
            if (Request.Params["DeleteStock"] != null) { DeleteStock(); }
            if (Request.Params["AddStock"] != null) { AddStock(); }
        }

        private void GetStock()
        {
            try
            {
                JObject jsonData = new JObject();
                ApiResponse apiResponse = Web_Request(jsonData.ToString(), ApiUrl + "/stock", "GET");
                Response.Write(JsonConvert.SerializeObject(apiResponse));
            }
            catch (Exception ex)
            {
                Response.Write(JsonConvert.SerializeObject(new ApiResponse(HttpStatusCode.InternalServerError) { ResponseMessage = ex.Message }));
            }
        }

        private void AddStock()
        {
            try
            {
                JObject jsonData = JsonConvert.DeserializeObject<JObject>(GetBody(Request));
                ApiResponse apiResponse = Web_Request(jsonData.ToString(), ApiUrl + "/stock", "POST");
                Response.Write(JsonConvert.SerializeObject(apiResponse));
            }
            catch (Exception ex)
            {
                Response.Write(JsonConvert.SerializeObject(new ApiResponse(HttpStatusCode.InternalServerError) { ResponseMessage = ex.Message }));
            }
        }
        private void EditStock()
        {
            try
            {
                JObject jsonData = JsonConvert.DeserializeObject<JObject>(GetBody(Request));
                jsonData["id"] = Request.Params["id"];
                ApiResponse apiResponse = Web_Request(jsonData.ToString(), ApiUrl + "/stock", "PUT");
                Response.Write(JsonConvert.SerializeObject(apiResponse));
            }
            catch (Exception ex)
            {
                Response.Write(JsonConvert.SerializeObject(new ApiResponse(HttpStatusCode.InternalServerError) { ResponseMessage = ex.Message }));
            }
        }

        private void DeleteStock()
        {
            try
            {
                JObject jsonData = new JObject();
                jsonData["id"] = Request.Params["id"];
                ApiResponse apiResponse = Web_Request(jsonData.ToString(), ApiUrl + "/stock", "DELETE");
                Response.Write(JsonConvert.SerializeObject(apiResponse));
            }
            catch (Exception ex)
            {
                Response.Write(JsonConvert.SerializeObject(new ApiResponse(HttpStatusCode.InternalServerError) { ResponseMessage = ex.Message }));
            }
        }


        private ApiResponse Web_Request(object model, string postUrl, string method)
        {
            WebRequest request = WebRequest.Create(postUrl);
            request.Method = method;
            string postData = string.Empty;
            if (model.GetType() == postUrl.GetType()) { postData = (string)model; }
            else { postData = JsonConvert.SerializeObject(model); }
            byte[] byteArray = Encoding.UTF8.GetBytes(postData);
            request.ContentType = "application/json";
            request.ContentLength = byteArray.Length;
            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();
            WebResponse response = request.GetResponse();
            dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();
            reader.Close();
            dataStream.Close();
            response.Close();
            ApiResponse apiResponse = JsonConvert.DeserializeObject<ApiResponse>(responseFromServer);
            return apiResponse;
        }
        private class ApiResponse
        {
            public HttpStatusCode HttpResponseCode { get; set; }
            public string ResponseMessage { get; set; }

            public object ResponseObject { get; set; }

            public ApiResponse(HttpStatusCode httpResponseCode)
            {
                HttpResponseCode = httpResponseCode;
            }
        }
        private string GetBody(HttpRequest Request)
        {
            string documentContents;
            using (Stream receiveStream = Request.InputStream)
            {
                using (StreamReader readStream = new StreamReader(receiveStream, Request.ContentEncoding))
                {
                    documentContents = readStream.ReadToEnd();
                }
            }
            return documentContents;
        }
    }
}