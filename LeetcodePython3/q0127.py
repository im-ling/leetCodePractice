#!/usr/bin/python3
from datetime import datetime
from typing import List


class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        un_used = set()
        current_level_set = set()
        current_level_set.add(beginWord)

        def can_transfer(word1: str, word2: str) -> int:
            diff = 0
            for i in range(len(word1)):
                if word1[i] != word2[i]:
                    diff += 1
                    if diff > 1:
                        return False
            return diff == 1

        for word in wordList:
            un_used.add(word)
        if beginWord in un_used:
            un_used.remove(beginWord)

        if endWord not in un_used:
            return 0

        level = 1
        while len(current_level_set) > 0:
            level += 1
            next_level = set()
            for word in current_level_set:
                for word_unused in un_used:
                    if can_transfer(word, word_unused):
                        if word_unused == endWord:
                            return level
                        if word_unused not in next_level:
                            next_level.add(word_unused)
            for word in next_level:
                un_used.remove(word)
            current_level_set = next_level

        return 0


begin = "zings"
end = "brown"
wordList = ["chump","sours","mcgee","piers","match","folds","rinse","films","small","umbel","assad","morin","plied","basin","moots","blurb","suits","solve","sooty","fluky","bombs","nurse","ceres","lopes","yucky","ricks","goads","loses","coyly","marcy","bonds","niece","cures","sonic","crows","dicey","gaped","buggy","riles","homer","fakir","hello","riper","makes","laked","sinus","fangs","acton","spiky","salts","boots","skiff","maker","pence","fells","cedar","kited","raved","flake","jiffy","tanks","barns","sized","gluts","amman","jumps","cavil","quaff","rents","looms","toner","gibes","aside","drawn","karin","torte","haded","psych","hacks","jesus","fumed","lisle","spays","sumps","beats","tunas","naked","bathe","gulfs","karma","snuff","boast","grins","turds","plant","spicy","risen","tints","tomas","stand","noses","toxin","sheep","paddy","abase","jeeps","dated","tough","timid","forty","kusch","pones","smack","token","havel","vanes","repay","chums","paved","chimp","spinx","smirk","pupas","bares","mites","egged","palsy","gyros","wolfe","chips","pouts","johns","barbs","slunk","hires","seals","rally","tromp","roads","writs","aches","corny","fiats","hench","gilts","blake","phony","drams","skimp","suing","horus","hewer","barfs","hewed","needs","epsom","knots","tided","befit","eager","melva","coves","plush","pawed","zebra","gales","blots","foggy","rooks","comas","laxly","cries","kirks","monks","magic","fugue","apter","limos","congo","rosin","seder","bones","holes","fated","gamay","snags","wimpy","rites","gilds","slink","staph","sioux","bends","wilma","warts","reeds","yolks","lover","demon","salve","hulas","shard","worst","leach","omits","flint","tines","julio","trots","silly","cocks","gleam","react","camps","nicks","bored","coded","swine","scope","aloes","south","hands","rainy","david","newer","ferns","jelly","index","gibbs","truly","tubes","opera","raven","noyce","whims","titus","hared","vined","dealt","slats","erick","rolls","breed","udder","oozed","prays","tsars","harry","shelf","norms","larks","hazes","brice","gifts","units","veeps","dumas","mommy","spock","dotty","molls","slobs","diane","buddy","boost","ginny","rends","marks","timur","bands","genes","slews","leeds","karyn","mobil","mixes","ronny","sadly","rinks","smash","baled","pulpy","toils","yards","piing","dried","veils","spook","snaky","sizer","spout","percy","sheol","blank","waxes","herod","attar","doped","polls","banes","penny","knelt","laded","manic","acids","squat","jerry","stony","woofs","idles","bruin","carla","sheik","hodge","goody","merge","nicer","scums","evens","lames","wends","midge","jives","tuner","reins","boars","fryer","realm","dyson","narks","torts","yawed","waked","cress","curvy","bongs","fared","jilts","liens","ducat","shaft","pesos","dulls","donna","potty","winks","marsh","giddy","tiffs","scoot","nifty","daisy","slots","stacy","colby","skims","malls","sifts","jinns","flank","molar","hatch","wiped","taped","clink","brims","credo","fezes","molds","finds","quids","terra","damns","dusky","wanes","musty","barer","snare","honey","piked","wiser","elvin","dolly","fetal","ships","reign","cause","caved","mecca","blink","close","birth","pints","reefs","amado","comae","waite","willy","lorry","nixed","quire","napes","voted","eldon","nappy","myles","laser","pesky","leant","septa","mucks","agree","sworn","lofty","slush","holst","tevet","wases","cheer","torah","treks","purge","class","popes","roans","curve","quads","magma","drier","hales","chess","prigs","sivan","romes","finch","peels","mousy","atria","offer","coals","crash","tauts","oinks","dazed","flaps","truck","treed","colas","petty","marty","cadet","clips","zones","wooed","haves","grays","gongs","minis","macaw","horde","witch","flows","heady","fuels","conks","lifts","tumid","husks","irony","pines","glops","fonds","covey","chino","riggs","tonya","slavs","caddy","poled","blent","mired","whose","scows","forte","hikes","riped","knobs","wroth","bagel","basks","nines","scams","males","holed","solid","farms","glaxo","poise","drays","ryder","slash","rajas","goons","bowed","shirt","blurs","fussy","rills","loren","helps","feels","fiefs","hines","balms","blobs","fiord","light","dinky","maids","sagas","joked","pyxed","lilly","leers","galls","malts","minos","ionic","lower","peale","ratty","tuber","newed","whirl","eases","wests","herds","clods","floes","skate","weeds","tones","rangy","kings","adder","pitts","smith","coats","lenny","sorta","floss","looks","angie","peppy","upper","darin","white","lofts","clint","jared","heros","ruler","tonia","sexed","grail","villa","topic","kenny","dopes","hoots","boobs","gerry","eries","lyres","lunch","glove","cumin","harms","races","today","crust","track","mends","snout","shark","iliad","shrew","dorky","monty","dodge","toted","worse","dream","weird","gaunt","damon","rimes","layer","salem","bards","dills","hobby","gives","shall","crazy","brace","faxed","pools","foamy","viral","strop","liver","ceded","jolts","jonah","tight","lilia","hussy","mutts","crate","girls","marge","hypos","mewls","bulls","gazes","wands","avior","sonya","slick","clump","cater","aural","agave","grief","shana","fices","moans","grape","fetid","jenna","humus","poesy","cooks","still","lease","wanda","oddly","areas","frats","imply","files","ramon","seuss","hubby","wakes","rural","nodal","doric","carry","chefs","fails","klaus","shine","filly","yawls","brows","cabby","favor","styli","filed","jinni","ferry","balls","lakes","voled","drone","lusty","tansy","among","trail","liven","slake","madge","steps","donne","sties","picks","lacks","jumpy","meade","bogie","bauer","scene","lubes","brigs","label","fines","grebe","limns","mouse","ensue","swags","bunch","kayla","micky","sneak","bulbs","camus","yours","aisha","dunne","volta","cores","dweeb","libby","flees","shops","bided","satan","socks","draws","golfs","taunt","genus","belts","orbit","taxis","hinds","fakes","chart","wings","words","digit","copse","deena","perry","sanes","huffy","chung","lucks","fills","selma","wafts","pecks","trite","combs","sooth","weary","salty","brews","kooky","robby","loans","props","huang","marry","swabs","tinny","mince","japed","ellis","lowed","newly","loath","drown","loved","joker","lints","kinky","skits","feats","hiker","doles","every","dolby","stirs","lobed","fusty","cozen","vader","byron","dozes","slows","bethe","ploys","misty","binds","bumpy","spurs","wolfs","ernie","nails","prows","seeds","visas","dowse","pores","jocks","cower","hoofs","mined","marat","gorge","souse","clack","liter","jewel","hates","boats","stark","blabs","murks","woken","stomp","peeks","perky","pasta","goats","hocks","kinks","gushy","outdo","gelds","foxes","fives","sybil","upton","taine","helga","mauls","gills","grows","bauds","aloft","cline","payer","pinch","thorn","slits","thumb","biked","cowls","grams","disks","belly","randy","hunts","prize","minty","river","chevy","gages","cysts","years","scoff","becky","inert","abler","bevel","dyers","tonne","glows","ocean","spits","bowen","tings","baths","goals","whiny","merry","fares","leila","cairo","honor","verge","teary","pimps","sarah","meets","tamed","bumps","alias","pings","wears","dante","snore","ruled","savor","gapes","loony","chaps","froth","fancy","herbs","cutes","crowd","ghana","teddy","abate","scalp","mules","patsy","minks","shuck","billy","helen","stain","moles","jodie","homed","stack","niger","denny","kinds","elves","waled","rover","medan","churn","whizz","green","reach","lajos","mates","ditch","grads","start","press","rimed","hells","vised","slums","notes","canes","taper","camry","weans","sinks","arise","crown","prier","ramps","wotan","chars","mussy","rodes","sonar","cheri","sired","snell","basel","eider","sades","times","ovule","gusto","myrna","gabby","dully","spake","beast","towns","allay","gaged","smell","skids","clone","slack","pooch","vulva","arson","blown","kongo","maize","thick","brags","spore","soles","trial","snort","price","bowel","stoke","pents","hutch","flack","arced","cubic","hiram","tongs","lades","coons","finer","games","unpin","vests","slabs","santa","tamer","asian","tease","miked","lodes","vents","leafy","stats","shuts","bully","edith","bloch","corps","bloom","doses","coins","skips","gains","hided","coops","ninja","pills","raves","hanks","seres","ewing","bests","wrath","burgs","thrum","cabin","daren","imams","junks","brood","bacon","creel","gazed","teats","halos","gypsy","ether","train","tiles","bulks","bolls","added","roger","sites","balmy","tilts","swoop","jules","bawdy","mango","stoop","girts","costs","lemur","yucks","swazi","okays","piped","ticks","tomes","filch","depth","meals","coots","bites","pansy","spelt","leeks","hills","drops","verde","japes","holds","bangs","maxed","plume","frets","lymph","modes","twits","devon","cawed","putty","sowed","likes","quips","board","loxed","slags","dilly","refit","saved","takes","meter","prove","spacy","poach","cilia","pears","lists","gated","verdi","shave","notch","culls","shams","weedy","gaols","hoops","kraft","burro","roles","rummy","click","plots","mitty","yanks","drool","papal","rearm","prose","fucks","berra","salas","tents","flues","loves","poker","parry","polyp","agent","flown","walls","studs","troll","baron","earle","panda","wiley","raged","sexes","berne","vista","rojas","cones","byway","vases","wines","forth","freya","gully","fires","sails","dusts","terse","booed","stung","basic","saver","basis","hmong","brawn","pured","locks","downs","punts","rhine","metes","title","shims","bents","blows","harte","boyle","peach","posts","olson","might","flier","rubes","lingo","tarts","nexus","woman","mains","finis","mikes","pleas","trams","shawl","gunny","sleds","ruder","aries","usher","refed","toady","caper","tries","gimpy","doors","thieu","deere","mucky","rests","mares","cards","bouts","dines","rants","giles","flunk","enact","derek","dover","conan","mooed","fiver","kaput","enrol","payed","feint","miner","shyer","whelk","perch","furor","hayes","tammy","caves","maims","cairn","tract","legal","adler","veldt","basal","spiny","surer","bolds","grove","heaps","noway","pokes","tubed","beaks","loots","drawl","jones","typed","funny","cells","beaus","bayed","rears","seats","hazed","flubs","maura","goths","rumba","morse","fumes","slide","snoot","music","sully","perth","pocks","mills","lopez","sacks","stine","gawks","gavel","rains","wound","hares","guild","leger","foxed","craws","rinds","faced","groom","lully","boded","lends","serge","sword","faked","envoy","stick","tumor","riser","bolts","trued","gasps","thoth","veers","verbs","boles","lunar","taxes","vexes","pucks","welsh","pelts","shift","booth","smote","spied","gnawn","crete","dough","tasha","timed","wired","state","hears","lauds","wills","dummy","basil","belie","calls","crams","matts","gybes","limed","snots","moder","faces","sibyl","spare","crops","drips","frown","doggy","pearl","reese","curls","earns","poles","tiara","risks","lethe","titan","tucks","trace","vises","prick","sears","ogled","preps","livid","kicky","candy","weeps","tapes","cokes","foods","wards","coifs","shirk","elsie","ketch","trunk","goofs","kodak","toyed","lance","whale","soups","roars","poxed","tombs","noons","hindi","basie","hoffa","bayou","tests","roots","shove","hoses","doled","tempt","kilos","velma","avers","dorks","comic","fanny","poops","sicks","leary","merer","finks","garbo","cains","mimed","sates","celli","flats","grown","broth","augur","chaos","sangs","chide","barks","guide","mewed","synch","rings","scrap","zings","howls","duded","noemi","geeks","nexis","comte","helot","whams","brand","hogan","moira","trips","loges","baits","winds","marla","never","louis","anted","helix","morns","heeds","crags","rowdy","becks","venue","diary","stoat","feeds","kiths","riled","drags","lucia","deeps","sends","fonts","swing","fence","stout","trice","taker","drugs","babel","plows","pends","sloes","gents","brawl","arabs","leaps","flied","fulls","meats","megan","burch","oscar","evict","betsy","lasts","ethos","mavis","petal","fever","alone","snips","assay","rocks","talon","grass","clive","discs","wrapt","calfs","razed","learn","bruce","midst","swear","merck","meyer","funks","lobby","fears","decay","sedge","alien","reaps","koran","range","enter","lepke","honed","gallo","staid","joist","lines","paler","fined","sorts","piper","highs","busch","dario","north","ashed","sands","songs","rakes","garza","pinks","rival","leann","allow","golds","hilts","berry","hicks","idler","weiss","cider","desks","skies","hulls","warns","datum","brown","leapt","dregs","dozed","stump","reply","finny","clues","diode","dicks","rabid","moors","limbs","gulls","scary","dungs","liege","vicky","nigel","peeps","dolls","blame","sings","wants","fuzes","proud","bungs","seams","bingo","buffs","shire","decks","hosed","scots","pumas","jazzy","books","ellie","hayed","snowy","twill","links","coped","spats","reyes","piles","hovel","reads","wryer","patty","sling","oneal","waves","gorse","ofter","teams","strep","mores","daily","spoil","limes","foots","dells","hakes","danny","furls","flaws","tarot","dusty","potts","tells","pager","claps","serra","josie","award","pewee","snack","lobes","damps","tanya","lures","mushy","hertz","caret","marco","parks","pithy","synge","spoon","troth","drama","bleak","lidia","banns","forms","iambs","crick","patel","mercy","waded"]

starttime = datetime.now()
result = Solution().ladderLength(begin, end, wordList)
endtime = datetime.now()

print(result)
print(endtime - starttime)