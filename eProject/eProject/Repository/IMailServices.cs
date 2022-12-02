using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProject.Repository
{
    public interface IMailService
    {
        Task SendMail(string toMail, string subject, string body);
    }
}
