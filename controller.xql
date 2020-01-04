xquery version "3.1";
declare variable $exist:root external;
declare variable $exist:prefix external;
declare variable $exist:controller external;
declare variable $exist:path external;
declare variable $exist:resource external;

declare variable $uri as xs:anyURI := request:get-uri();
declare variable $context as xs:string := request:get-context-path();
declare variable $ftcontroller as xs:string := concat($context, $exist:prefix, $exist:controller, '/');

if (not(contains($exist:resource, '.')))
then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <forward url="{concat($exist:controller, '/modules', $exist:path, '.xql')}"/>
        <view>
            <forward url="{concat($exist:controller, '/views/reading_view.xql')}"/>
            <forward url="{concat($exist:controller, '/views/wrapper.xql')}"/>
        </view>

        <cache-control cache="no"/>
    </dispatch>
else
    <ignore
        xmlns="http://exist.sourceforge.net/NS/exist">
        <cache-control
            cache="yes"/>
    </ignore>