#pragma checksum "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "daf2d5e9200fcb0819f205f679a598819a6660d6"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_Admin_Views_Auction_Details), @"mvc.1.0.view", @"/Areas/Admin/Views/Auction/Details.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\_ViewImports.cshtml"
using eProject;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\_ViewImports.cshtml"
using eProject.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"daf2d5e9200fcb0819f205f679a598819a6660d6", @"/Areas/Admin/Views/Auction/Details.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"f10561b1c200766559e800ea7446594538b9cebb", @"/Areas/Admin/Views/_ViewImports.cshtml")]
    public class Areas_Admin_Views_Auction_Details : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<eProject.ViewModel.CatAuctionUser>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("img-fluid"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("alt", new global::Microsoft.AspNetCore.Html.HtmlString("First slide"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Index", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/mdb.min.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_4 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("rel", new global::Microsoft.AspNetCore.Html.HtmlString("stylesheet"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_5 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/js/mdb.min.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
  
    ViewData["Title"] = "Details";
    Layout = "~/Areas/Admin/Views/_Layout.cshtml";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"<div style=""align-content:center;padding:8%;"">
    <div class=""row"" style=""border: thin ridge lightgray; border-radius: 10px; padding: 10px; box-shadow: 5px 5px 5px gray;"">
        <div class=""col-md-4"">
            <!--Carousel Wrapper-->
            <div id=""carousel-thumb"" class=""carousel slide carousel-fade carousel-thumbnails"" data-ride=""carousel"">

                <!--Slides-->
                <div class=""carousel-inner text-center text-md-left"" role=""listbox"">
");
#nullable restore
#line 14 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                      
                        var images = Model.Auction.Image.Split(",");

#line default
#line hidden
#nullable disable
            WriteLiteral("                        <div class=\"carousel-item active\">\r\n                            ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "daf2d5e9200fcb0819f205f679a598819a6660d66737", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "src", 2, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            AddHtmlAttributeValue("", 809, "~/images/", 809, 9, true);
#nullable restore
#line 17 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
AddHtmlAttributeValue("", 818, images[0], 818, 10, false);

#line default
#line hidden
#nullable disable
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n                        </div>\r\n");
#nullable restore
#line 19 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                        if (images.Length > 1)
                        {
                            for (int i = 1; i < images.Length; i++)
                            {


#line default
#line hidden
#nullable disable
            WriteLiteral("                                <div class=\"carousel-item\">\r\n                                    ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "daf2d5e9200fcb0819f205f679a598819a6660d68895", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "src", 2, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            AddHtmlAttributeValue("", 1166, "~/images/", 1166, 9, true);
#nullable restore
#line 25 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
AddHtmlAttributeValue("", 1175, images[i], 1175, 10, false);

#line default
#line hidden
#nullable disable
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n                                </div>\r\n");
#nullable restore
#line 27 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                            }
                        }
                    

#line default
#line hidden
#nullable disable
            WriteLiteral(@"                </div>
                <!--/.Slides-->
                <!--Thumbnails-->
                <a class=""carousel-control-prev"" href=""#carousel-thumb"" role=""button"" data-slide=""prev"">
                    <span class=""carousel-control-prev-icon"" aria-hidden=""true""></span>
                    <span class=""sr-only"">Previous</span>
                </a>
                <a class=""carousel-control-next"" href=""#carousel-thumb"" role=""button"" data-slide=""next"">
                    <span class=""carousel-control-next-icon"" aria-hidden=""true""></span>
                    <span class=""sr-only"">Next</span>
                </a>
                <!--/.Thumbnails-->
                <div id=""checkout""></div>
            </div>
            <!--/.Carousel Wrapper-->
            
        </div>
        <div class=""col-md-8"">
            <h1>");
#nullable restore
#line 48 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayFor(model => model.Auction.Title));

#line default
#line hidden
#nullable disable
            WriteLiteral("</h1><br />\r\n\r\n            <div id=\"demo\" style=\"font-size:3rem;color:red;\">0d: 0h:0m: 0s</div>\r\n");
#nullable restore
#line 51 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
             if (ViewBag.Win != null)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <h5><b>Winner:</b> <span>");
#nullable restore
#line 53 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                                    Write(ViewBag.Win.Buyer.Username);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span></h5>\r\n                <h5><b>SalePrice:</b> <span>");
#nullable restore
#line 54 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                                       Write(ViewBag.Win.Auction.SalePrice);

#line default
#line hidden
#nullable disable
            WriteLiteral(" $</span></h5>\r\n");
#nullable restore
#line 55 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </div>\r\n    </div>\r\n    <div>\r\n        <dl class=\"row\"  style=\"border: thin ridge lightgray; border-radius: 10px; padding: 10px; margin: 8%; box-shadow: 5px 5px 5px gray;\">\r\n            <dt class=\"col-sm-3\">\r\n                ");
#nullable restore
#line 61 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.Condition));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dt>\r\n            <dd class=\"col-sm-9\">\r\n                ");
#nullable restore
#line 64 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayFor(model => model.Auction.Condition));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dd>\r\n            <dt class=\"col-sm-3\">\r\n                ");
#nullable restore
#line 67 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayNameFor(model => model.Category.CategoryName));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dt>\r\n            <dd class=\"col-sm-9\">\r\n                ");
#nullable restore
#line 70 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayFor(model => model.Category.CategoryName));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dd>\r\n            <dt class=\"col-sm-3\">\r\n                ");
#nullable restore
#line 73 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.StartDate));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dt>\r\n            <dd class=\"col-sm-9\">\r\n                ");
#nullable restore
#line 76 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayFor(model => model.Auction.StartDate));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dd>\r\n            <dt class=\"col-sm-3\">\r\n                ");
#nullable restore
#line 79 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.EndDate));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dt>\r\n            <dd class=\"col-sm-9\">\r\n                ");
#nullable restore
#line 82 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayFor(model => model.Auction.EndDate));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dd>\r\n            <dt class=\"col-sm-3\">\r\n                ");
#nullable restore
#line 85 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.Document));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dt>\r\n            <dd class=\"col-sm-9\">\r\n");
#nullable restore
#line 88 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                 if (Model.Auction.Document != null)
                {

#line default
#line hidden
#nullable disable
            WriteLiteral("                    ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "daf2d5e9200fcb0819f205f679a598819a6660d617650", async() => {
#nullable restore
#line 90 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                                                            Write(Model.Auction.Document);

#line default
#line hidden
#nullable disable
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "href", 2, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            AddHtmlAttributeValue("", 4027, "~/Document/", 4027, 11, true);
#nullable restore
#line 90 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
AddHtmlAttributeValue("", 4038, Model.Auction.Document, 4038, 23, false);

#line default
#line hidden
#nullable disable
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n");
#nullable restore
#line 91 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                }
                else
                {

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <i>No file</i>\r\n");
#nullable restore
#line 95 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                }

#line default
#line hidden
#nullable disable
            WriteLiteral("            </dd>\r\n            <dt class=\"col-sm-2\">\r\n                ");
#nullable restore
#line 98 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.MinimumBid));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dt>\r\n            <dd class=\"col-sm-10\">\r\n                ");
#nullable restore
#line 101 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayFor(model => model.Auction.MinimumBid));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dd>\r\n            <dt class=\"col-sm-2\">\r\n                ");
#nullable restore
#line 104 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.BidIncremenent));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dt>\r\n            <dd class=\"col-sm-10\">\r\n                ");
#nullable restore
#line 107 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.DisplayFor(model => model.Auction.BidIncremenent));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </dd>\r\n\r\n        </dl>\r\n        <div style=\"border: thin ridge lightgray; border-radius: 10px; padding: 10px; box-shadow: 5px 5px 5px gray;\">\r\n            <h5><b>Description</b></h5>\r\n            <p>\r\n                ");
#nullable restore
#line 114 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
           Write(Html.Raw(Model.Auction.Description.Replace("\n", "<br />")));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </p>\r\n        </div>\r\n        \r\n    </div>\r\n    <div>\r\n");
#nullable restore
#line 120 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
         if (Model.Auction.Status == "Active")
        {
            

#line default
#line hidden
#nullable disable
#nullable restore
#line 122 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
       Write(Html.ActionLink("Lock", "InactiveAuction", new { id = Model.Auction.AuctionId }));

#line default
#line hidden
#nullable disable
#nullable restore
#line 122 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                                                                                             
        }
        else if (Model.Auction.Status == "Approval")
        {
            

#line default
#line hidden
#nullable disable
#nullable restore
#line 126 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
       Write(Html.ActionLink("Approval", "ActiveAuction", new { id = Model.Auction.AuctionId }));

#line default
#line hidden
#nullable disable
#nullable restore
#line 126 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                                                                                               
        }
        else if (Model.Auction.Status == "Inactive")
        {
            

#line default
#line hidden
#nullable disable
#nullable restore
#line 130 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
       Write(Html.ActionLink("Delete", "Delete", new { id = Model.Auction.AuctionId }, new { onclick = "return confirm('Are you sure to delete?')" }));

#line default
#line hidden
#nullable disable
#nullable restore
#line 130 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                                                                                                                                                     
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("        ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "daf2d5e9200fcb0819f205f679a598819a6660d624791", async() => {
                WriteLiteral("Back to List");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_2.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"
    </div>
</div>

<script>
    function convertUTCDateToLocalDate(date) {
        var newDate = new Date(date.getTime() + date.getTimezoneOffset() * 60 * 1000);

        var offset = date.getTimezoneOffset() / 60;
        var hours = date.getHours();

        newDate.setHours(hours - offset);

        return newDate;
    }
    // Set the date we're counting down to

    var countDownDate = ");
#nullable restore
#line 149 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\Details.cshtml"
                   Write(Model.Auction.EndDate.Subtract(new DateTime(1970, 1, 1, 0, 0, 0)).TotalMilliseconds);

#line default
#line hidden
#nullable disable
            WriteLiteral(@";
// Update the count down every 1 second
var x = setInterval(function() {

    // Get today's date and time
    var now = new Date();
    var date = convertUTCDateToLocalDate(new Date(now));
    var daynow = date.getTime();
    // Find the distance between now and the count down date
    var distance = countDownDate - daynow;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Output the result in an element with id=""demo""
  document.getElementById(""demo"").innerHTML = days + ""d :"" + hours + ""h :""
  + minutes + ""m :"" + seconds + ""s "";

  // If the count down is over, write some text
  if (distance < 0) {
    clearInterval(x);
      document.getElementById(""demo"").innerHTML = ""FINISH"";

  }
}, 1000);");
            WriteLiteral("\r\n\r\n\r\n</script>\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "daf2d5e9200fcb0819f205f679a598819a6660d627812", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_4);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "daf2d5e9200fcb0819f205f679a598819a6660d628927", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_5);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<eProject.ViewModel.CatAuctionUser> Html { get; private set; }
    }
}
#pragma warning restore 1591
