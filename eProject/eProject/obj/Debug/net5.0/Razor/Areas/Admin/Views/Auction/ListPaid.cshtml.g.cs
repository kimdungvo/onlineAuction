#pragma checksum "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "cc8fce006f3dd02bfe5673f5ed7fd3a3ff04f538"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_Admin_Views_Auction_ListPaid), @"mvc.1.0.view", @"/Areas/Admin/Views/Auction/ListPaid.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"cc8fce006f3dd02bfe5673f5ed7fd3a3ff04f538", @"/Areas/Admin/Views/Auction/ListPaid.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"f10561b1c200766559e800ea7446594538b9cebb", @"/Areas/Admin/Views/_ViewImports.cshtml")]
    public class Areas_Admin_Views_Auction_ListPaid : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IEnumerable<eProject.ViewModel.ViewAuctionWin>>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("style", new global::Microsoft.AspNetCore.Html.HtmlString("height: 200px; max-width: 400px"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 3 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
  
    ViewData["Title"] = "List Paid";
    Layout = "~/Areas/Admin/Views/_Layout.cshtml";


#line default
#line hidden
#nullable disable
            WriteLiteral("<h1 class=\"text-center\">Auction has been paid</h1>\r\n<br />\r\n<p style=\"text-align:right\">Total Price: ");
#nullable restore
#line 10 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
                                    Write(ViewBag.total);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n<table class=\"table table-hover\" id=\"auction\">\r\n    <thead class=\"table-success\">\r\n        <tr>\r\n            <th>\r\n                ");
#nullable restore
#line 15 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.AuctionId));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 18 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.Title));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 21 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.Image));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>           \r\n            <th>\r\n                ");
#nullable restore
#line 24 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.StartDate));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 27 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.EndDate));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 30 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
           Write(Html.DisplayNameFor(model => model.Auction.SalePrice));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 33 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
           Write(Html.DisplayNameFor(model => model.Buyer.Username));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            \r\n            \r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n");
#nullable restore
#line 40 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
         foreach (var item in Model)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <tr>\r\n                <td>");
#nullable restore
#line 43 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
               Write(item.Auction.AuctionId);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 44 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
               Write(item.Auction.Title);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>\r\n");
#nullable restore
#line 46 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
                       var images = item.Auction.Image.Split(",");

#line default
#line hidden
#nullable disable
            WriteLiteral("                        ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "cc8fce006f3dd02bfe5673f5ed7fd3a3ff04f5388587", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "src", 2, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            AddHtmlAttributeValue("", 1492, "~/images/", 1492, 9, true);
#nullable restore
#line 47 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
AddHtmlAttributeValue("", 1501, images[0], 1501, 10, false);

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
            WriteLiteral("\r\n");
            WriteLiteral("                </td>               \r\n                <td>");
#nullable restore
#line 50 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
               Write(item.Auction.StartDate);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 51 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
               Write(item.Auction.EndDate);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 52 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
               Write(item.Auction.SalePrice);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 53 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"
               Write(item.Buyer.Username);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>                            \r\n            </tr>\r\n");
#nullable restore
#line 55 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Areas\Admin\Views\Auction\ListPaid.cshtml"

        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </tbody>\r\n</table>\r\n");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IEnumerable<eProject.ViewModel.ViewAuctionWin>> Html { get; private set; }
    }
}
#pragma warning restore 1591
