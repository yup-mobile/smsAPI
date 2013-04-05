using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Security.Cryptography;
using System.Xml;

namespace PMLibary
{
    class Program
    {
        static void Main(string[] args)
        {
            PostManAPI.sendsms("zhengyp", "12345678aA!", "恭喜发财", "13917980980", "", "");
        }
    }
}
