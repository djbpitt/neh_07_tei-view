xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare variable $texts as element(text)+ := collection('/db/apps/hoax/TEI')//text;
declare variable $rss as element(rs)+ := $texts//rs;
<list xmlns="">{
for $rs in $rss
let $key := $rs/@ref
group by $key
order by $key
return 
    <key value="{$key}">{
        for $r in $rs
        group by $subkey := $r ! normalize-space(.)
        order by $subkey
        return <item count="{count($r)}">{$subkey}</item>
    }</key>
}</list>