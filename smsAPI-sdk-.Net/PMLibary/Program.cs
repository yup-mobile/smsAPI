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
            //Console.WriteLine(PostManAPI.checkBalance("zhengyp", "aca3955f5c65c2f4be6c2bf8a2c956d2").ToString());
            PostManAPI.sendsms("zhengyp", "aca3955f5c65c2f4be6c2bf8a2c956d2", "恭喜发财--.net test", "13901731266;18621817213", "", "");
        }
    }
}
