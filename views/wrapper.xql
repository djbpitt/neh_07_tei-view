xquery version "3.1";
declare default element namespace "http://www.w3.org/1999/xhtml";
<html>
    <head><title>Hi, Mom!</title></head>
    <body>{request:get-attribute('html')}</body>
</html>