#pragma checksum "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Views\Checkout\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "7e1592a7b6e1810fa61e81d785a0f4ff5a43fdce"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Checkout_Index), @"mvc.1.0.view", @"/Views/Checkout/Index.cshtml")]
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
#line 1 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Views\_ViewImports.cshtml"
using eProject;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Views\_ViewImports.cshtml"
using eProject.Models;

#line default
#line hidden
#nullable disable
#nullable restore
#line 3 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Views\_ViewImports.cshtml"
using X.PagedList.Mvc.Core;

#line default
#line hidden
#nullable disable
#nullable restore
#line 4 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Views\_ViewImports.cshtml"
using X.PagedList;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"7e1592a7b6e1810fa61e81d785a0f4ff5a43fdce", @"/Views/Checkout/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"7b991285f258652fe2d45e47b604f1a32faa4f00", @"/Views/_ViewImports.cshtml")]
    public class Views_Checkout_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Stripe.Checkout.Session>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Views\Checkout\Index.cshtml"
  
    ViewBag.Title = "Home Page";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<script src=""https://js.stripe.com/v3/""></script>

<br />
<br />

<button class=""btn btn-info"" id=""btnPay"">
    Pay Now
</button>

<script>
    var stripe = Stripe('pk_test_51KFFdMBgF6PMJrwmjp7NH0NvdoMSo4kEEIcSuYHhvSvcVNhckXR9JwFnMcyMQQCirLGiyV9qydoDHPd7iqcbIBWd00luZwFxQL');

    var element = document.getElementById('btnPay');

    element.addEventListener('click', function () {
        stripe.redirectToCheckout({
            sessionId: '");
#nullable restore
#line 22 "C:\Users\KIM DUNG\Downloads\OnlineAuction_Group3_T1.2008.A0\eProject\eProject\eProject\Views\Checkout\Index.cshtml"
                   Write(Model.Id);

#line default
#line hidden
#nullable disable
            WriteLiteral("\'\r\n        }), then(function (result) {\r\n\r\n        });\r\n    });\r\n</script>");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Stripe.Checkout.Session> Html { get; private set; }
    }
}
#pragma warning restore 1591