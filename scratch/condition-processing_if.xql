xquery version "3.1";
(: context testing inside helper function for conditional processing :)
declare function local:dispatch($node) as item()* {
    typeswitch($node)
        case text() return $node
        case element(root) return local:root($node)
        case element(div) return local:div($node)
        default return local:passthru($node)
};
declare function local:root($node as element(root)) as element(body) {
    <body>{local:passthru($node)}</body>
};
declare function local:div($node as element(div)) as element(section) {
    if (count($node/ancestor::div) eq 0) 
    then <section class="section">{local:passthru($node)}</section>
        else if (count($node/ancestor::div) eq 1) 
        then <section class="subsection">{local:passthru($node)}</section>
            else if (count($node/ancestor::div) eq 2)
            then <section class="subsubsection">{local:passthru($node)}</section>
                else <section>{local:passthru($node)}</section>
};
declare function local:passthru($node as node()) {
    for $child in $node/node()
    return
        local:dispatch($child)
};        
declare variable $root as element (root) := 
    <root>
        <div>This is a top-level div.
            <div>With a second-level one that contains
                <div>a third-level one and
                    <div>fourth!</div>
                </div>
            </div>
        </div>
    </root>;
local:dispatch($root)