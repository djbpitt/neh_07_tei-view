xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare variable $stories as document-node()+ := 
	collection('/db/apps/neh_07_tei-view/xml');
declare variable $story_id as xs:string? := 
    request:get-parameter('story', 'hammersmithghost_times_1804', false());
declare variable $story_filename as xs:string := concat($story_id, '.xml');
declare variable $story as document-node()? := 
	$stories[ends-with(base-uri(), $story_filename)];
	
if ($story) then
    <TEI>{
        $story//(titleStmt/title | text)
    }</TEI>
else
    <error xmlns="">{concat('No such story:', $story_id)}</error>