xquery version "3.1";
declare function local:dispatch($node as node()) as item()* {
    typeswitch($node)
        case text() return $node
        case element(root) return local:root($node)
        case element(p) return local:p($node)
        case element(emph) return local:emph($node)
        default return local:passthru($node)
};
declare function local:root($node as element(root)) as element(body){
    <body>{local:passthru($node)}</body>
};
declare function local:p($node as element(p)) as element (p) {
    <p>{local:passthru($node)}</p>
};
declare function local:emph($node as element(emph)) as item()* {
    switch($node/@rend)
        case 'bold' return <b>{local:passthru($node)}</b>
        case 'italic' return <i>{local:passthru($node)}</i>
        case 'sc' return <sc>{local:passthru($node)}</sc>
        default return local:passthru($node)
};
declare function local:passthru($node as node()) as item()* {
    for $child in $node/node()
    return local:dispatch($child)
};
declare variable $test as element(root) :=
    <root>
        <p>Some <emph rend="italic">italics!</emph></p>
        <p>Some <emph rend="bold">bold!</emph></p>
        <p>Some <emph rend="sc">small caps!</emph></p>
        <p>Some <emph rend="oops">erroneous @rend value!</emph></p>
        <p>Rend value is <emph>missing <emph rend="sc">but with embedded sc</emph>!</emph></p>
    </root>;
local:dispatch($test)