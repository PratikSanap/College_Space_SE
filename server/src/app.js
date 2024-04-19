let http =require('http');
let fs = require('fs');
const html = fs.readFileSync('./in.html','utf-8')
const server =http.createServer((request,response)=>{
    response.end(html);
    console.log("A new request has been made");
});

server.listen(5000,'Localhost',()=>{
    console.log("server has been started")
})
