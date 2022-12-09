’	
?C:\Users\micuc\source\repos\ShopBeer\Components\CategoryMenu.cs
	namespace 	
ShopBeer
 
. 

Components 
{		 
public

 

class

 
CategoryMenu

 
:

 
ViewComponent

 ,
{ 
private 
readonly 
ICategoryRepository ,
_categoryRepository- @
;@ A
public 
CategoryMenu 
( 
ICategoryRepository /
categoryRepository0 B
)B C
{ 	
_categoryRepository 
=  !
categoryRepository" 4
;4 5
} 	
public  
IViewComponentResult #
Invoke$ *
(* +
)+ ,
{ 	
var 

categories 
= 
_categoryRepository 0
.0 1

Categories1 ;
.; <
OrderBy< C
(C D
pD E
=>F H
pI J
.J K
CategoryNameK W
)W X
;X Y
return 
View 
( 

categories "
)" #
;# $
} 	
} 
} ‹
FC:\Users\micuc\source\repos\ShopBeer\Components\ShoppingCartSummary.cs
	namespace		 	
ShopBeer		
 
.		 

Components		 
{

 
public 

class 
ShoppingCartSummary $
:$ %
ViewComponent& 3
{ 
private 
readonly 
ShoppingCart %
_shoppingCart& 3
;3 4
public 
ShoppingCartSummary "
(" #
ShoppingCart# /
shoppingCart0 <
)< =
{ 	
_shoppingCart 
= 
shoppingCart (
;( )
} 	
public  
IViewComponentResult #
Invoke$ *
(* +
)+ ,
{ 	
var 
items 
= 
_shoppingCart %
.% & 
GetShoppingCartItems& :
(: ;
); <
;< =
_shoppingCart 
. 
ShoppingCartItems +
=, -
items. 3
;3 4
var !
shoppingCartViewModel %
=& '
new( +!
ShoppingCartViewModel, A
{ 
ShoppingCart 
= 
_shoppingCart ,
,, -
ShoppingCartTotal !
=" #
_shoppingCart$ 1
.1 2 
GetShoppingCartTotal2 F
(F G
)G H
} 
; 
return 
View 
( !
shoppingCartViewModel -
)- .
;. /
}   	
}!! 
}"" ã
BC:\Users\micuc\source\repos\ShopBeer\Controllers\HomeController.cs
	namespace 	
ShopBeer
 
. 
Controllers 
{		 
public

 

class

 
HomeController

 
:

  

Controller

! +
{ 
public 
readonly 
IProductRepository *
_productRepository+ =
;= >
public 
HomeController 
( 
IProductRepository 0
productRepository1 B
)B C
{ 	
_productRepository 
=  
productRepository! 2
;2 3
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
} 
} î
CC:\Users\micuc\source\repos\ShopBeer\Controllers\OrderController.cs
	namespace		 	
ShopBeer		
 
.		 
Controllers		 
{

 
public 

class 
OrderController  
:! "

Controller# -
{ 
private 
readonly 
IOrderRepository )
_orderRepository* :
;: ;
private 
readonly 
ShoppingCart %
_shoppingCart& 3
;3 4
public 
OrderController 
( 
IOrderRepository /
orderRepository0 ?
,? @
ShoppingCartA M
shoppingCartN Z
)Z [
{ 	
_orderRepository 
= 
orderRepository .
;. /
_shoppingCart 
= 
shoppingCart (
;( )
} 	
public 
IActionResult 
Checkout %
(% &
)& '
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 
CheckoutComplete -
(- .
). /
{ 	
ViewBag 
. #
CheckoutCompleteMessage +
=, -
$str. J
;J K
return   
View   
(   
)   
;   
}!! 	
}"" 
}## ’A
EC:\Users\micuc\source\repos\ShopBeer\Controllers\ProductController.cs
	namespace 	
ShopBeer
 
. 
Controllers 
{ 
public 

class 
ProductController "
:" #

Controller$ .
{ 
private 
readonly 
ICategoryRepository ,
_categoryRepository- @
;@ A
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
AppDbContext %
_appDbContext& 3
;3 4
public 
ProductController  
(  !
ICategoryRepository! 4
categoryRepository5 G
,G H
IProductRepositoryI [
productRepository\ m
,m n
AppDbContexto {
appDbContext	| à
)
à â
{ 	
_categoryRepository 
=  !
categoryRepository" 4
;4 5
_productRepository 
=  
productRepository! 2
;2 3
_appDbContext 
= 
appDbContext (
;( )
} 	
public 

ViewResult 
List 
( 
string %
category& .
). /
{ 	
string 
	_category 
= 
category '
;' (
IEnumerable 
< 
Product 
>  
products! )
=* +
_productRepository, >
.> ?
Products? G
.G H
OrderByH O
(O P
nP Q
=>R T
nU V
.V W
	ProductIdW `
)` a
;a b
string 
currentCategory "
=# $
string% +
.+ ,
Empty, 1
;1 2
if!! 
(!! 
string!! 
.!! 
IsNullOrEmpty!! #
(!!# $
category!!$ ,
)!!, -
)!!- .
{"" 
products## 
=## 
_productRepository## -
.##- .
Products##. 6
.##6 7
OrderBy##7 >
(##> ?
n##? @
=>##A C
n##D E
.##E F
	ProductId##F O
)##O P
;##P Q
currentCategory$$ 
=$$  !
$str$$" -
;$$- .
}%% 
else&& 
{'' 
if(( 
((( 
string(( 
.(( 
Equals((  
(((  !
$str((! ,
,((, -
	_category((. 7
,((7 8
StringComparison((9 I
.((I J
OrdinalIgnoreCase((J [
)(([ \
)((\ ]
{)) 
products** 
=** 
_productRepository** 1
.**1 2
Products**2 :
.**: ;
Where**; @
(**@ A
p**A B
=>**C E
p**F G
.**G H
Category**H P
.**P Q
CategoryName**Q ]
.**] ^
Equals**^ d
(**d e
$str**e p
)**p q
)**q r
.**r s
OrderBy**s z
(**z {
p**{ |
=>**} 
p
**Ä Å
.
**Å Ç
Name
**Ç Ü
)
**Ü á
;
**á à
}++ 
if-- 
(-- 
string-- 
.-- 
Equals-- !
(--! "
$str--" -
,--- .
	_category--/ 8
,--8 9
StringComparison--: J
.--J K
OrdinalIgnoreCase--K \
)--\ ]
)--] ^
{.. 
products// 
=// 
_productRepository// 1
.//1 2
Products//2 :
.//: ;
Where//; @
(//@ A
p//A B
=>//C E
p//F G
.//G H
Category//H P
.//P Q
CategoryName//Q ]
.//] ^
Equals//^ d
(//d e
$str//e p
)//p q
)//q r
.//r s
OrderBy//s z
(//z {
p//{ |
=>//} 
p
//Ä Å
.
//Å Ç
Name
//Ç Ü
)
//Ü á
;
//á à
}00 
if11 
(11 
string11 
.11 
Equals11 !
(11! "
$str11" 0
,110 1
	_category112 ;
,11; <
StringComparison11= M
.11M N
OrdinalIgnoreCase11N _
)11_ `
)11` a
{22 
products33 
=33 
_productRepository33 1
.331 2
Products332 :
.33: ;
Where33; @
(33@ A
p33A B
=>33C E
p33F G
.33G H
Category33H P
.33P Q
CategoryName33Q ]
.33] ^
Equals33^ d
(33d e
$str33e s
)33s t
)33t u
.33u v
OrderBy33v }
(33} ~
p33~ 
=>
33Ä Ç
p
33É Ñ
.
33Ñ Ö
Name
33Ö â
)
33â ä
;
33ä ã
}44 
currentCategory66 
=66  !
	_category66" +
;66+ ,
}77 
var;;  
productListViewModel;; $
=;;% &
new;;' * 
ProductListViewModel;;+ ?
{<< 
Products== 
=== 
products== #
,==# $
CurrentCategory>> 
=>>  !
currentCategory>>" 1
}?? 
;?? 
returnAA 
ViewAA 
(AA  
productListViewModelAA ,
)AA, -
;AA- .
}BB 	
[DD 	
HttpGetDD	 
]DD 
publicEE 
IActionResultEE 
IndexEE "
(EE" #
stringEE# )
	searchingEE* 3
)EE3 4
{FF 	
ViewDataGG 
[GG 
$strGG "
]GG" #
=GG$ %
	searchingGG& /
;GG/ 0
IEnumerableHH 
<HH 
ProductHH 
>HH  
productsHH! )
=HH* +
_productRepositoryHH, >
.HH> ?
ProductsHH? G
.HHG H
OrderByHHH O
(HHO P
nHHP Q
=>HHR T
nHHU V
.HHV W
	ProductIdHHW `
)HH` a
;HHa b
ifJJ 
(JJ 
!JJ 
stringJJ 
.JJ 
IsNullOrEmptyJJ %
(JJ% &
	searchingJJ& /
)JJ/ 0
)JJ0 1
{KK 
productsLL 
=LL 
_productRepositoryLL -
.LL- .
ProductsLL. 6
.LL6 7
WhereLL7 <
(LL< =
nLL= >
=>LL? A
nLLB C
.LLC D
NameLLD H
.LLH I
ContainsLLI Q
(LLQ R
	searchingLLR [
)LL[ \
)LL\ ]
;LL] ^
}MM 
returnOO 
ViewOO 
(OO 
productsOO  
)OO  !
;OO! "
}PP 	
publicRR 
IActionResultRR 
IndexRR "
(RR" #
)RR# $
{SS 	
returnTT 
ViewTT 
(TT 
)TT 
;TT 
}UU 	
publicWW 
IActionResultWW 
CreateWW #
(WW# $
)WW$ %
{XX 	
returnYY 
ViewYY 
(YY 
)YY 
;YY 
}ZZ 	
[\\ 	
HttpPost\\	 
]\\ 
public]] 
IActionResult]] 
Create]] #
(]]# $
[]]$ %
Bind]]% )
(]]) *
$str]]* q
)]]q r
]]]r s
Product]]t {
product	]]| É
)
]]É Ñ
{^^ 	
if__ 
(__ 

ModelState__ 
.__ 
IsValid__ "
)__" #
{`` 
_appDbContextaa 
.aa 
Addaa !
(aa! "
productaa" )
)aa) *
;aa* +
_appDbContextbb 
.bb 
SaveChangesbb )
(bb) *
)bb* +
;bb+ ,
returncc 
RedirectToActioncc '
(cc' (
nameofcc( .
(cc. /
Listcc/ 3
)cc3 4
)cc4 5
;cc5 6
}dd 
returnee 
Viewee 
(ee 
productee 
)ee  
;ee  !
}ff 	
}gg 
}hh ñ
DC:\Users\micuc\source\repos\ShopBeer\Controllers\SearchController.cs
	namespace

 	
ShopBeer


 
.

 
Controllers

 
{ 
public 

class 
SearchController !
:" #

Controller$ .
{ 
private 
readonly 
AppDbContext %
_appDbContext& 3
;3 4
public 
SearchController 
(  
AppDbContext  ,
appDbContext- 9
)9 :
{ 	
_appDbContext 
= 
appDbContext (
;( )
} 	
public 
IActionResult 
Index "
(" #
string# )
term* .
). /
{ 	
IEnumerable 
< 
Product 
>  
Products! )
=* +
_appDbContext, 9
.9 :
Products: B
.B C
WhereC H
(H I
sI J
=>K M
sN O
.O P
NameP T
.T U
ContainsU ]
(] ^
term^ b
)b c
)c d
.d e
Selecte k
(k l
sl m
=>n p
new 
Product 
{ 
	ProductId 
= 
s 
. 
	ProductId (
,( )
Name 
= 
s 
. 
Name 
, 
Description 
= 
s  
.  !
Description! ,
,, -
Price 
= 
s 
. 
Price  
,  !
ImageUrl 
= 
s 
. 
ImageUrl &
,& '
ImageThumbnailUrl   "
=  # $
s  % &
.  & '
ImageThumbnailUrl  ' 8
,  8 9
Category!! 
=!! 
s!! 
.!! 
Category!! &
,!!& '

CategoryId"" 
="" 
s"" 
.""  

CategoryId""  *
}## 
)## 
;## 
return%% 
View%% 
(%% 
Products%%  
)%%  !
;%%! "
}&& 	
public)) 

JsonResult)) 
AutoComplete)) &
())& '
string))' -
prefix)). 4
)))4 5
{** 	
List-- 
<-- 
Product-- 
>-- 
ObjList-- !
=--" #
new--$ '
List--( ,
<--, -
Product--- 4
>--4 5
(--5 6
)--6 7
{.. 
new00 
Product00 
{00  !
Name00! %
=00% &
$str00& ?
}00@ A
,00A B
new11 
Product11 
{11  !
Name11! %
=11% &
$str11& E
}11F G
,11G H
new22 
Product22 
{22  !
Name22! %
=22% &
$str22& 2
}223 4
,224 5
}55 
;55 
var77 
Name77 
=77 
(77 
from77 
N77 
in77 !
ObjList77" )
where88 
N88 
.88  
Name88  $
.88$ %

StartsWith88% /
(88/ 0
prefix880 6
)886 7
select99 
new99 "
{99# $
N99% &
.99& '
Name99' +
}99, -
)99- .
;99. /
return:: 
Json:: 
(:: 
Name:: 
):: 
;:: 
}== 	
}?? 
}@@ –!
JC:\Users\micuc\source\repos\ShopBeer\Controllers\ShoppingCartController.cs
	namespace

 	
ShopBeer


 
.

 
Controllers

 
{ 
public 

class "
ShoppingCartController '
:' (

Controller) 3
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
ShoppingCart %
_shoppingCart& 3
;3 4
public "
ShoppingCartController %
(% &
IProductRepository& 8
productRepository9 J
,J K
ShoppingCartL X
shoppingCartY e
)e f
{ 	
_productRepository 
=  
productRepository! 2
;2 3
_shoppingCart 
= 
shoppingCart (
;( )
} 	
public 

ViewResult 
Index 
(  
)  !
{ 	
var 
items 
= 
_shoppingCart %
.% & 
GetShoppingCartItems& :
(: ;
); <
;< =
_shoppingCart 
. 
ShoppingCartItems +
=, -
items. 3
;3 4
var 
sCVM 
= 
new !
ShoppingCartViewModel 0
{ 
ShoppingCart 
= 
_shoppingCart ,
,, -
ShoppingCartTotal   !
=  " #
_shoppingCart  $ 1
.  1 2 
GetShoppingCartTotal  2 F
(  F G
)  G H
}!! 
;!! 
return## 
View## 
(## 
sCVM## 
)## 
;## 
}$$ 	
public&& 
IActionResult&& 
NoItemsInCart&& *
(&&* +
)&&+ ,
{'' 	
return(( 
View(( 
((( 
)(( 
;(( 
})) 	
public,, "
RedirectToActionResult,, %
AddToShoppingCart,,& 7
(,,7 8
int,,8 ;
	productId,,< E
),,E F
{-- 	
var.. 
selectedProduct.. 
=..  !
_productRepository.." 4
...4 5
Products..5 =
...= >
FirstOrDefault..> L
(..L M
p..M N
=>..O Q
p..R S
...S T
	ProductId..T ]
==..^ `
	productId..a j
)..j k
;..k l
if// 
(// 
selectedProduct// 
!=//  "
null//# '
)//' (
{00 
_shoppingCart11 
.11 
	AddToCart11 '
(11' (
selectedProduct11( 7
,117 8
$num119 :
)11: ;
;11; <
}22 
return33 
RedirectToAction33 #
(33# $
$str33$ +
)33+ ,
;33, -
}44 	
public66 "
RedirectToActionResult66 %"
RemoveFromShoppingCart66& <
(66< =
int66= @
	productId66A J
)66J K
{77 	
var88 
selectedProduct88 
=88  !
_productRepository88" 4
.884 5
Products885 =
.88= >
FirstOrDefault88> L
(88L M
p88M N
=>88O Q
p88R S
.88S T
	ProductId88T ]
==88^ `
	productId88a j
)88j k
;88k l
if99 
(99 
selectedProduct99 
!=99  "
null99# '
)99' (
{:: 
_shoppingCart;; 
.;; 
RemoveFromCart;; ,
(;;, -
selectedProduct;;- <
);;< =
;;;= >
}<< 
return== 
RedirectToAction== #
(==# $
$str==$ +
)==+ ,
;==, -
}>> 	
public@@ 
IActionResult@@ 
Checkout@@ %
(@@% &
)@@& '
{AA 	
_shoppingCartBB 
.BB 
	ClearCartBB #
(BB# $
)BB$ %
;BB% &
returnCC 
ViewCC 
(CC 
)CC 
;CC 
}DD 	
}FF 
}GG Ó
9C:\Users\micuc\source\repos\ShopBeer\Data\AppDbContext.cs
	namespace 	
ShopBeer
 
. 
Data 
{		 
public

 

class

 
AppDbContext

 
:

 
	DbContext

 (
{ 
public 
AppDbContext 
( 
DbContextOptions ,
<, -
AppDbContext- 9
>9 :
options; B
)B C
:D E
baseF J
(J K
optionsK R
)R S
{ 	
} 	
public 
DbSet 
< 
Product 
> 
Products &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DbSet 
< 
Category 
> 

Categories )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DbSet 
< 
ShoppingCartItem %
>% &
ShoppingCartItems' 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
DbSet 
< 
Order 
> 
Orders "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DbSet 
< 
OrderDetail  
>  !
OrderDetails" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} Á
KC:\Users\micuc\source\repos\ShopBeer\Data\Interfaces\ICategoryRepository.cs
	namespace 	
ShopBeer
 
. 
Data 
. 

Interfaces "
{ 
public		 

	interface		 
ICategoryRepository		 (
{

 
IEnumerable 
< 
Category 
> 

Categories (
{) *
get+ .
;. /
}0 1
} 
} º
HC:\Users\micuc\source\repos\ShopBeer\Data\Interfaces\IOrderRepository.cs
	namespace 	
ShopBeer
 
. 
Data 
. 

Interfaces "
{ 
public		 

	interface		 
IOrderRepository		 %
{

 
void 
CreateOrder 
( 
Order 
order $
)$ %
;% &
} 
} Ë
JC:\Users\micuc\source\repos\ShopBeer\Data\Interfaces\IProductRepository.cs
	namespace 	
ShopBeer
 
. 
Data 
. 

Interfaces "
{ 
public		 

	interface		 
IProductRepository		 '
{

 
IEnumerable 
< 
Product 
> 
Products %
{& '
get( +
;+ ,
}- .
Product 
GetProductById 
( 
int "
	productId# ,
), -
;- .
} 
} “

IC:\Users\micuc\source\repos\ShopBeer\Data\mocks\MockCategoryRepository.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
mocks 
{		 
public

 

class

 "
MockCategoryRepository

 '
:

( )
ICategoryRepository

* =
{ 
public 
IEnumerable 
< 
Category #
># $

Categories% /
{0 1
get 
{ 
return 
new 
List 
<  
Category  (
>( )
{ 
new 
Category  
{! "
CategoryName" .
=/ 0
$str1 <
,< =
Description> I
=J K
$strL b
}b c
,c d
new 
Category  
{! "
CategoryName" .
=/ 0
$str1 <
,< =
Description> I
=J K
$strL b
}b c
,c d
new 
Category  
{! "
CategoryName" .
=/ 0
$str1 ?
,? @
DescriptionA L
=M N
$strO h
}h i
,i j
} 
; 
} 
} 	
} 
} Ë
HC:\Users\micuc\source\repos\ShopBeer\Data\mocks\MockProductRepository.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
mocks 
{		 
public

 

class

 !
MockProductRepository

 &
:

' (
IProductRepository

) ;
{ 
private 
readonly 
ICategoryRepository ,
_categoryRepository- @
=A B
newC F"
MockCategoryRepositoryG ]
(] ^
)^ _
;_ `
public 
IEnumerable 
< 
Product "
>" #
Products$ ,
{- .
get 
{ 
return 
new 
List 
<  
Product  '
>' (
{ 
new 
Product 
{ 
Name 
= 
$str 8
,8 9
Description #
=$ %
$str& G
,G H
Price 
= 
$num  %
,% &
Category  
=! "
_categoryRepository# 6
.6 7

Categories7 A
.A B
FirstB G
(G H
)H I
,I J
ImageUrl  
=! "
$str# n
} 
, 
new 
Product 
{ 
Name 
= 
$str >
,> ?
Description #
=$ %
$str& G
,G H
Price   
=   
$num    %
,  % &
Category!!  
=!!! "
_categoryRepository!!# 6
.!!6 7

Categories!!7 A
.!!A B
First!!B G
(!!G H
)!!H I
,!!I J
ImageUrl""  
=""! "
$str""# t
}## 
,## 
}$$ 
;$$ 
}%% 
}&& 	
public(( 
Product(( 
GetProductById(( %
(((% &
int((& )
	productId((* 3
)((3 4
{)) 	
throw** 
new** #
NotImplementedException** -
(**- .
)**. /
;**/ 0
}++ 	
},, 
}-- …
<C:\Users\micuc\source\repos\ShopBeer\Data\Models\Category.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
Models 
{ 
public 

class 
Category 
{		 
public

 
int

 

CategoryId

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
string 
CategoryName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
List 
< 
Product 
> 
Products %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ≈)
AC:\Users\micuc\source\repos\ShopBeer\Data\Models\DbInitializer.cs
	namespace 	
ShopBeer
 
. 
Data 
{		 
public

 

class

 
DbInitializer

 
{ 
public 
static 
void 
Seed 
(  
IApplicationBuilder  3
applicationBuilder4 F
)F G
{ 	
var 
scopeeee 
= 
applicationBuilder -
.- .
ApplicationServices. A
.A B
CreateScopeB M
(M N
)N O
;O P
AppDbContext 
context  
=! "
scopeeee# +
.+ ,
ServiceProvider, ;
.; <
GetRequiredService< N
<N O
AppDbContextO [
>[ \
(\ ]
)] ^
;^ _
if 
( 
! 
context 
. 

Categories #
.# $
Any$ '
(' (
)( )
)) *
{ 
context 
. 

Categories "
." #
AddRange# +
(+ ,

Categories, 6
.6 7
Select7 =
(= >
c> ?
=>@ B
cC D
.D E
ValueE J
)J K
)K L
;L M
} 
if 
( 
! 
context 
. 
Products !
.! "
Any" %
(% &
)& '
)' (
{ 
context 
. 
AddRange  
( 
new 
Product 
{ 
Name 
= 
$str 8
,8 9
Description #
=$ %
$str& G
,G H
Price   
=   
$num    %
,  % &
Category!!  
=!!! "

Categories!!# -
[!!- .
$str!!. 9
]!!9 :
,!!: ;
ImageUrl""  
=""! "
$str""# n
}## 
,## 
new%% 
Product%% 
{&& 
Name'' 
='' 
$str'' >
,''> ?
Description(( #
=(($ %
$str((& G
,((G H
Price)) 
=)) 
$num))  %
,))% &
Category**  
=**! "

Categories**# -
[**- .
$str**. 9
]**9 :
,**: ;
ImageUrl++  
=++! "
$str++# t
},, 
,,, 
new.. 
Product.. 
{// 
Name00 
=00 
$str00 4
,004 5
Description11 #
=11$ %
$str11& K
,11K L
Price22 
=22 
$num22  %
,22% &
Category33  
=33! "

Categories33# -
[33- .
$str33. <
]33< =
,33= >
ImageUrl44  
=44! "
$str44# e
}55 
)77 
;77 
}88 
context:: 
.:: 
SaveChanges:: 
(::  
)::  !
;::! "
};; 	
private== 
static== 

Dictionary== !
<==! "
string==" (
,==( )
Category==* 2
>==2 3

categories==4 >
;==> ?
public?? 
static?? 

Dictionary??  
<??  !
string??! '
,??' (
Category??) 1
>??1 2

Categories??3 =
{@@ 	
getAA 
{BB 
ifCC 
(CC 

categoriesCC 
==CC !
nullCC" &
)CC& '
{DD 
varEE 

genresListEE "
=EE# $
newEE% (
CategoryEE) 1
[EE1 2
]EE2 3
{FF 
newGG 
CategoryGG $
{GG% &
CategoryNameGG& 2
=GG3 4
$strGG5 @
,GG@ A
DescriptionGGB M
=GGN O
$strGGP f
}GGf g
,GGg h
newHH 
CategoryHH $
{HH% &
CategoryNameHH& 2
=HH3 4
$strHH5 @
,HH@ A
DescriptionHHB M
=HHN O
$strHHP f
}HHf g
,HHg h
newII 
CategoryII $
{II% &
CategoryNameII& 2
=II3 4
$strII5 C
,IIC D
DescriptionIIE P
=IIQ R
$strIIS l
}IIl m
,IIm n
}JJ 
;JJ 

categoriesLL 
=LL  
newLL! $

DictionaryLL% /
<LL/ 0
stringLL0 6
,LL6 7
CategoryLL8 @
>LL@ A
(LLA B
)LLB C
;LLC D
foreachNN 
(NN 
CategoryNN %
genreNN& +
inNN, .

genresListNN/ 9
)NN9 :
{OO 

categoriesPP "
.PP" #
AddPP# &
(PP& '
genrePP' ,
.PP, -
CategoryNamePP- 9
,PP9 :
genrePP; @
)PP@ A
;PPA B
}QQ 
}RR 
returnTT 

categoriesTT !
;TT! "
}UU 
}VV 	
}WW 
}XX º-
9C:\Users\micuc\source\repos\ShopBeer\Data\Models\Order.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
Models 
{		 
public

 

class

 
Order

 
{ 
[ 	
	BindNever	 
] 
public 
int 
OrderId 
{ 
get  
;  !
set" %
;% &
}' (
public 
List 
< 
OrderDetail 
>  

OrderLines! +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
Required	 
( 
ErrorMessage 
=  
$str! ?
)? @
]@ A
[ 	
Display	 
( 
Name 
= 
$str $
)$ %
]% &
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
Required	 
( 
ErrorMessage 
=  
$str! >
)> ?
]? @
[ 	
Display	 
( 
Name 
= 
$str #
)# $
]$ %
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
) 
] 
[ 	
Display	 
( 
Name 
= 
$str (
)( )
]) *
public 
string 
AddressLine1 "
{# $
get% (
;( )
set* -
;- .
}/ 0
[   	
Display  	 
(   
Name   
=   
$str   (
)  ( )
]  ) *
public!! 
string!! 
AddressLine2!! "
{!!# $
get!!% (
;!!( )
set!!* -
;!!- .
}!!/ 0
[## 	
Required##	 
(## 
ErrorMessage## 
=##  
$str##! =
)##= >
]##> ?
[$$ 	
Display$$	 
($$ 
Name$$ 
=$$ 
$str$$ "
)$$" #
]$$# $
[%% 	
StringLength%%	 
(%% 
$num%% 
,%% 
MinimumLength%% '
=%%( )
$num%%* +
)%%+ ,
]%%, -
public&& 
string&& 
ZipCode&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
[(( 	
StringLength((	 
((( 
$num(( 
)(( 
](( 
public)) 
string)) 
State)) 
{)) 
get)) !
;))! "
set))# &
;))& '
}))( )
[++ 	
Required++	 
(++ 
ErrorMessage++ 
=++  
$str++! <
)++< =
]++= >
[,, 	
StringLength,,	 
(,, 
$num,, 
),, 
],, 
public-- 
string-- 
Country-- 
{-- 
get--  #
;--# $
set--% (
;--( )
}--* +
[// 	
Required//	 
(// 
ErrorMessage// 
=//  
$str//! A
)//A B
]//B C
[00 	
StringLength00	 
(00 
$num00 
)00 
]00 
[11 	
DataType11	 
(11 
DataType11 
.11 
PhoneNumber11 &
)11& '
]11' (
[22 	
Display22	 
(22 
Name22 
=22 
$str22 &
)22& '
]22' (
public33 
string33 
PhoneNumber33 !
{33" #
get33$ '
;33' (
set33) ,
;33, -
}33. /
[55 	
Required55	 
]55 
[66 	
StringLength66	 
(66 
$num66 
)66 
]66 
[77 	
DataType77	 
(77 
DataType77 
.77 
EmailAddress77 '
)77' (
]77( )
[88 	
RegularExpression88	 
(88 
$str	88  
,
88  À
ErrorMessage99 
=99 
$str99 Q
)99Q R
]99R S
public:: 
string:: 
Email:: 
{:: 
get:: !
;::! "
set::# &
;::& '
}::( )
[<< 	
	BindNever<<	 
]<< 
[== 	
ScaffoldColumn==	 
(== 
false== 
)== 
]== 
public>> 
decimal>> 

OrderTotal>> !
{>>" #
get>>$ '
;>>' (
set>>) ,
;>>, -
}>>. /
[@@ 	
	BindNever@@	 
]@@ 
[AA 	
ScaffoldColumnAA	 
(AA 
falseAA 
)AA 
]AA 
publicBB 
DateTimeBB 
OrderPlacedBB #
{BB$ %
getBB& )
;BB) *
setBB+ .
;BB. /
}BB0 1
}CC 
}DD á
?C:\Users\micuc\source\repos\ShopBeer\Data\Models\OrderDetail.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
Models 
{ 
public 

class 
OrderDetail 
{		 
public

 
int

 
OrderDetailId

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
int 
OrderId 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Amount 
{ 
get 
;  
set! $
;$ %
}& '
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
virtual 
Product 
Product &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
virtual 
Order 
Order "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ö
;C:\Users\micuc\source\repos\ShopBeer\Data\Models\Product.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
Models 
{ 
public 

class 
Product 
{		 
public

 
int

 
	ProductId

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
ImageThumbnailUrl '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
int 

CategoryId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
virtual 
Category 
Category  (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} æ
EC:\Users\micuc\source\repos\ShopBeer\Data\Models\SearchResultModel.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
Models 
{ 
public		 

class		 
SearchResultModel		 "
{

 
public 
string 
Query 
{ 
get !
;! "
set# &
;& '
}( )
public 
IEnumerable 
< 
Product "
>" #
Products$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
int 
ProductCount 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} àA
@C:\Users\micuc\source\repos\ShopBeer\Data\Models\ShoppingCart.cs
	namespace		 	
ShopBeer		
 
.		 
Data		 
.		 
Models		 
{

 
public 

class 
ShoppingCart 
{ 
private 
readonly 
AppDbContext %
_appDbContext& 3
;3 4
public 
ShoppingCart 
( 
AppDbContext (
appDbContext) 5
)5 6
{ 	
_appDbContext 
= 
appDbContext (
;( )
} 	
public 
string 
ShoppingCartId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
List 
< 
ShoppingCartItem $
>$ %
ShoppingCartItems& 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
static 
ShoppingCart "
GetCart# *
(* +
IServiceProvider+ ;
services< D
)D E
{ 	
ISession 
session 
= 
services '
.' (
GetRequiredService( :
<: ; 
IHttpContextAccessor; O
>O P
(P Q
)Q R
?R S
. 
HttpContext 
. 
Session $
;$ %
var 
context 
= 
services "
." #

GetService# -
<- .
AppDbContext. :
>: ;
(; <
)< =
;= >
string 
cartId 
= 
session #
.# $
	GetString$ -
(- .
$str. 6
)6 7
??8 :
Guid; ?
.? @
NewGuid@ G
(G H
)H I
.I J
ToStringJ R
(R S
)S T
;T U
session 
. 
	SetString 
( 
$str &
,& '
cartId( .
). /
;/ 0
return!! 
new!! 
ShoppingCart!! #
(!!# $
context!!$ +
)!!+ ,
{!!- .
ShoppingCartId!!/ =
=!!> ?
cartId!!@ F
}!!G H
;!!H I
}"" 	
public$$ 
void$$ 
	AddToCart$$ 
($$ 
Product$$ %
product$$& -
,$$- .
int$$/ 2
amount$$3 9
)$$9 :
{%% 	
var&& 
shoppingCartItem&&  
=&&! "
_appDbContext'' 
.'' 
ShoppingCartItems'' /
.''/ 0
SingleOrDefault''0 ?
(''? @
s(( 
=>(( 
s(( 
.(( 
Product(( "
.((" #
	ProductId((# ,
==((- /
product((0 7
.((7 8
	ProductId((8 A
&&((B D
s((E F
.((F G
ShoppingCartId((G U
==((V X
ShoppingCartId((Y g
)((g h
;((h i
if** 
(** 
shoppingCartItem**  
==**! #
null**$ (
)**( )
{++ 
shoppingCartItem,,  
=,,! "
new,,# &
ShoppingCartItem,,' 7
{-- 
ShoppingCartId.. "
=..# $
ShoppingCartId..% 3
,..3 4
Product// 
=// 
product// %
,//% &
Amount00 
=00 
$num00 
}11 
;11 
_appDbContext22 
.22 
ShoppingCartItems22 /
.22/ 0
Add220 3
(223 4
shoppingCartItem224 D
)22D E
;22E F
}33 
else44 
{55 
shoppingCartItem66  
.66  !
Amount66! '
++66' )
;66) *
}77 
_appDbContext88 
.88 
SaveChanges88 %
(88% &
)88& '
;88' (
}99 	
public;; 
int;; 
RemoveFromCart;; !
(;;! "
Product;;" )
product;;* 1
);;1 2
{<< 	
var== 
shoppingCartItem==  
===! "
_appDbContext>> 
.>> 
ShoppingCartItems>> /
.>>/ 0
SingleOrDefault>>0 ?
(>>? @
s?? 
=>?? 
s?? 
.?? 
Product?? "
.??" #
	ProductId??# ,
==??- /
product??0 7
.??7 8
	ProductId??8 A
&&??B D
s??E F
.??F G
ShoppingCartId??G U
==??V X
ShoppingCartId??Y g
)??g h
;??h i
varAA 
localAmountAA 
=AA 
$numAA 
;AA  
ifCC 
(CC 
shoppingCartItemCC  
!=CC! #
nullCC$ (
)CC( )
{DD 
ifEE 
(EE 
shoppingCartItemEE $
.EE$ %
AmountEE% +
>EE, -
$numEE. /
)EE/ 0
{FF 
shoppingCartItemGG $
.GG$ %
AmountGG% +
--GG+ -
;GG- .
localAmountHH 
=HH  !
shoppingCartItemHH" 2
.HH2 3
AmountHH3 9
;HH9 :
}II 
elseJJ 
{KK 
_appDbContextLL !
.LL! "
ShoppingCartItemsLL" 3
.LL3 4
RemoveLL4 :
(LL: ;
shoppingCartItemLL; K
)LLK L
;LLL M
}MM 
}NN 
_appDbContextPP 
.PP 
SaveChangesPP %
(PP% &
)PP& '
;PP' (
returnRR 
localAmountRR 
;RR 
}SS 	
publicUU 
ListUU 
<UU 
ShoppingCartItemUU $
>UU$ % 
GetShoppingCartItemsUU& :
(UU: ;
)UU; <
{VV 	
returnWW 
ShoppingCartItemsWW $
??WW% '
(XX 
ShoppingCartItemsXX %
=XX& '
_appDbContextYY $
.YY$ %
ShoppingCartItemsYY% 6
.YY6 7
WhereYY7 <
(YY< =
cYY= >
=>YY? A
cYYB C
.YYC D
ShoppingCartIdYYD R
==YYS U
ShoppingCartIdYYV d
)YYd e
.ZZ 
IncludeZZ #
(ZZ# $
sZZ$ %
=>ZZ& (
sZZ) *
.ZZ* +
ProductZZ+ 2
)ZZ2 3
.[[ 
ToList[[ "
([[" #
)[[# $
)[[$ %
;[[% &
}\\ 	
public^^ 
void^^ 
	ClearCart^^ 
(^^ 
)^^ 
{__ 	
var`` 
	cartItmes`` 
=`` 
_appDbContext`` )
.aa 
ShoppingCartItemsaa "
.bb 
Wherebb 
(bb 
cartbb 
=>bb 
cartbb #
.bb# $
ShoppingCartIdbb$ 2
==bb3 5
ShoppingCartIdbb6 D
)bbD E
;bbE F
_appDbContextdd 
.dd 
ShoppingCartItemsdd +
.dd+ ,
RemoveRangedd, 7
(dd7 8
	cartItmesdd8 A
)ddA B
;ddB C
_appDbContextff 
.ff 
SaveChangesff %
(ff% &
)ff& '
;ff' (
}gg 	
publicii 
decimalii  
GetShoppingCartTotalii +
(ii+ ,
)ii, -
{jj 	
varkk 
totalkk 
=kk 
_appDbContextkk %
.kk% &
ShoppingCartItemskk& 7
.kk7 8
Wherekk8 =
(kk= >
ckk> ?
=>kk@ B
ckkC D
.kkD E
ShoppingCartIdkkE S
==kkT V
ShoppingCartIdkkW e
)kke f
.ll 
Selectll 
(ll 
cll 
=>ll 
cll 
.ll 
Productll &
.ll& '
Pricell' ,
*ll- .
cll/ 0
.ll0 1
Amountll1 7
)ll7 8
.ll8 9
Sumll9 <
(ll< =
)ll= >
;ll> ?
returnmm 
totalmm 
;mm 
}nn 	
}oo 
}pp ™
DC:\Users\micuc\source\repos\ShopBeer\Data\Models\ShoppingCartItem.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
Models 
{ 
public 

class 
ShoppingCartItem !
{		 
public

 
int

 
ShoppingCartItemId

 %
{

& '
get

( +
;

+ ,
set

- 0
;

0 1
}

2 3
public 
Product 
Product 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
Amount 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
ShoppingCartId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ≤
LC:\Users\micuc\source\repos\ShopBeer\Data\Repositories\CategoryRepository.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
Repositories $
{		 
public

 

class

 
CategoryRepository

 #
:

$ %
ICategoryRepository

& 9
{ 
private 
readonly 
AppDbContext %
_appDbContext& 3
;3 4
public 
CategoryRepository !
(! "
AppDbContext" .
appDbContext/ ;
); <
{ 	
_appDbContext 
= 
appDbContext (
;( )
} 	
public 
IEnumerable 
< 
Category #
># $

Categories% /
=>0 2
_appDbContext3 @
.@ A

CategoriesA K
;K L
} 
} ≠
IC:\Users\micuc\source\repos\ShopBeer\Data\Repositories\OrderRepository.cs
	namespace 	
ShopBeer
 
. 
Data 
. 
Repositories $
{		 
public

 

class

 
OrderRepository

  
:

! "
IOrderRepository

# 3
{ 
private 
readonly 
AppDbContext %
_appDbContext& 3
;3 4
private 
readonly 
ShoppingCart %
_shoppingCart& 3
;3 4
public 
OrderRepository 
( 
AppDbContext +
appDbContext, 8
,8 9
ShoppingCart: F
shoppingCartG S
)S T
{ 	
_appDbContext 
= 
appDbContext (
;( )
_shoppingCart 
= 
shoppingCart (
;( )
} 	
public 
void 
CreateOrder 
(  
Order  %
order& +
)+ ,
{ 	
order 
. 
OrderPlaced 
= 
DateTime  (
.( )
Now) ,
;, -
_appDbContext 
. 
Orders  
.  !
Add! $
($ %
order% *
)* +
;+ ,
var 
shoppingCartItems !
=" #
_shoppingCart$ 1
.1 2
ShoppingCartItems2 C
;C D
foreach 
( 
var 
shoppingCartItem )
in* ,
shoppingCartItems- >
)> ?
{   
var!! 
orderDetail!! 
=!!  !
new!!" %
OrderDetail!!& 1
(!!1 2
)!!2 3
{"" 
Amount## 
=## 
shoppingCartItem## -
.##- .
Amount##. 4
,##4 5
	ProductId$$ 
=$$ 
shoppingCartItem$$  0
.$$0 1
Product$$1 8
.$$8 9
	ProductId$$9 B
,$$B C
OrderId%% 
=%% 
order%% #
.%%# $
OrderId%%$ +
,%%+ ,
Price&& 
=&& 
shoppingCartItem&& ,
.&&, -
Product&&- 4
.&&4 5
Price&&5 :
}'' 
;'' 
_appDbContext)) 
.)) 
OrderDetails)) *
.))* +
Add))+ .
()). /
orderDetail))/ :
))): ;
;)); <
}** 
_appDbContext,, 
.,, 
SaveChanges,, %
(,,% &
),,& '
;,,' (
}-- 	
}.. 
}// Ï
KC:\Users\micuc\source\repos\ShopBeer\Data\Repositories\ProductRepository.cs
	namespace		 	
ShopBeer		
 
.		 
Data		 
.		 
Repositories		 $
{

 
public 

class 
ProductRepository "
:# $
IProductRepository% 7
{ 
private 
readonly 
AppDbContext %
_appDbContext& 3
;3 4
public 
ProductRepository  
(  !
AppDbContext! -
appDbContext. :
): ;
{ 	
_appDbContext 
= 
appDbContext (
;( )
} 	
public 
IEnumerable 
< 
Product "
>" #
Products$ ,
=>- /
_appDbContext0 =
.= >
Products> F
.F G
IncludeG N
(N O
cO P
=>Q S
cT U
.U V
CategoryV ^
)^ _
;_ `
public 
Product 
GetProductById %
(% &
int& )
	productId* 3
)3 4
=>5 7
_appDbContext8 E
.E F
ProductsF N
.N O
FirstOrDefaultO ]
(] ^
p^ _
=>` b
pc d
.d e
	ProductIde n
==o q
	productIdr {
){ |
;| }
} 
}  -
IC:\Users\micuc\source\repos\ShopBeer\Migrations\20220322201831_Initial.cs
	namespace 	
ShopBeer
 
. 

Migrations 
{ 
public 

partial 
class 
Initial  
:! "
	Migration# ,
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
CreateTable		 (
(		( )
name

 
:

 
$str

 "
,

" #
columns 
: 
table 
=> !
new" %
{ 

CategoryId 
=  
table! &
.& '
Column' -
<- .
int. 1
>1 2
(2 3
nullable3 ;
:; <
false= B
)B C
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
CategoryName  
=! "
table# (
.( )
Column) /
</ 0
string0 6
>6 7
(7 8
nullable8 @
:@ A
trueB F
)F G
,G H
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
nullable7 ?
:? @
trueA E
)E F
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 4
,4 5
x6 7
=>8 :
x; <
.< =

CategoryId= G
)G H
;H I
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str  
,  !
columns 
: 
table 
=> !
new" %
{ 
	ProductId 
= 
table  %
.% &
Column& ,
<, -
int- 0
>0 1
(1 2
nullable2 :
:: ;
false< A
)A B
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
nullable0 8
:8 9
true: >
)> ?
,? @
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
nullable7 ?
:? @
trueA E
)E F
,F G
Price 
= 
table !
.! "
Column" (
<( )
decimal) 0
>0 1
(1 2
nullable2 :
:: ;
false< A
)A B
,B C
ImageUrl   
=   
table   $
.  $ %
Column  % +
<  + ,
string  , 2
>  2 3
(  3 4
nullable  4 <
:  < =
true  > B
)  B C
,  C D
ImageThumbnailUrl!! %
=!!& '
table!!( -
.!!- .
Column!!. 4
<!!4 5
string!!5 ;
>!!; <
(!!< =
nullable!!= E
:!!E F
true!!G K
)!!K L
,!!L M

CategoryId"" 
=""  
table""! &
.""& '
Column""' -
<""- .
int"". 1
>""1 2
(""2 3
nullable""3 ;
:""; <
false""= B
)""B C
}## 
,## 
constraints$$ 
:$$ 
table$$ "
=>$$# %
{%% 
table&& 
.&& 

PrimaryKey&& $
(&&$ %
$str&&% 2
,&&2 3
x&&4 5
=>&&6 8
x&&9 :
.&&: ;
	ProductId&&; D
)&&D E
;&&E F
table'' 
.'' 

ForeignKey'' $
(''$ %
name(( 
:(( 
$str(( A
,((A B
column)) 
:)) 
x))  !
=>))" $
x))% &
.))& '

CategoryId))' 1
,))1 2
principalTable** &
:**& '
$str**( 4
,**4 5
principalColumn++ '
:++' (
$str++) 5
,++5 6
onDelete,,  
:,,  !
ReferentialAction,," 3
.,,3 4
Cascade,,4 ;
),,; <
;,,< =
}-- 
)-- 
;-- 
migrationBuilder// 
.// 
CreateIndex// (
(//( )
name00 
:00 
$str00 .
,00. /
table11 
:11 
$str11 !
,11! "
column22 
:22 
$str22 $
)22$ %
;22% &
}33 	
	protected55 
override55 
void55 
Down55  $
(55$ %
MigrationBuilder55% 5
migrationBuilder556 F
)55F G
{66 	
migrationBuilder77 
.77 
	DropTable77 &
(77& '
name88 
:88 
$str88  
)88  !
;88! "
migrationBuilder:: 
.:: 
	DropTable:: &
(::& '
name;; 
:;; 
$str;; "
);;" #
;;;# $
}<< 	
}== 
}>> ù
JC:\Users\micuc\source\repos\ShopBeer\Migrations\20220322210210_CartItem.cs
	namespace 	
ShopBeer
 
. 

Migrations 
{ 
public 

partial 
class 
CartItem !
:" #
	Migration$ -
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
CreateTable		 (
(		( )
name

 
:

 
$str

 )
,

) *
columns 
: 
table 
=> !
new" %
{ 
ShoppingCartItemId &
=' (
table) .
.. /
Column/ 5
<5 6
int6 9
>9 :
(: ;
nullable; C
:C D
falseE J
)J K
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
	ProductId 
= 
table  %
.% &
Column& ,
<, -
int- 0
>0 1
(1 2
nullable2 :
:: ;
true< @
)@ A
,A B
Amount 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
nullable/ 7
:7 8
false9 >
)> ?
,? @
ShoppingCartId "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
nullable: B
:B C
trueD H
)H I
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% ;
,; <
x= >
=>? A
xB C
.C D
ShoppingCartItemIdD V
)V W
;W X
table 
. 

ForeignKey $
($ %
name 
: 
$str G
,G H
column 
: 
x  !
=>" $
x% &
.& '
	ProductId' 0
,0 1
principalTable &
:& '
$str( 2
,2 3
principalColumn '
:' (
$str) 4
,4 5
onDelete  
:  !
ReferentialAction" 3
.3 4
Restrict4 <
)< =
;= >
} 
) 
; 
migrationBuilder 
. 
CreateIndex (
(( )
name 
: 
$str 6
,6 7
table   
:   
$str   *
,  * +
column!! 
:!! 
$str!! #
)!!# $
;!!$ %
}"" 	
	protected$$ 
override$$ 
void$$ 
Down$$  $
($$$ %
MigrationBuilder$$% 5
migrationBuilder$$6 F
)$$F G
{%% 	
migrationBuilder&& 
.&& 
	DropTable&& &
(&&& '
name'' 
:'' 
$str'' )
)'') *
;''* +
}(( 	
})) 
}** ⁄
HC:\Users\micuc\source\repos\ShopBeer\Migrations\20220323084625_Second.cs
	namespace 	
ShopBeer
 
. 

Migrations 
{ 
public 

partial 
class 
Second 
:  !
	Migration" +
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
}

 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} ≥0
GC:\Users\micuc\source\repos\ShopBeer\Migrations\20220323092511_Order.cs
	namespace 	
ShopBeer
 
. 

Migrations 
{ 
public 

partial 
class 
Order 
:  
	Migration! *
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
OrderId 
= 
table #
.# $
Column$ *
<* +
int+ .
>. /
(/ 0
nullable0 8
:8 9
false: ?
)? @
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B

OrderTotal 
=  
table! &
.& '
Column' -
<- .
decimal. 5
>5 6
(6 7
nullable7 ?
:? @
falseA F
)F G
,G H
OrderPlaced 
=  !
table" '
.' (
Column( .
<. /
DateTime/ 7
>7 8
(8 9
nullable9 A
:A B
falseC H
)H I
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 0
,0 1
x2 3
=>4 6
x7 8
.8 9
OrderId9 @
)@ A
;A B
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str $
,$ %
columns 
: 
table 
=> !
new" %
{ 
OrderDetailId !
=" #
table$ )
.) *
Column* 0
<0 1
int1 4
>4 5
(5 6
nullable6 >
:> ?
false@ E
)E F
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
OrderId 
= 
table #
.# $
Column$ *
<* +
int+ .
>. /
(/ 0
nullable0 8
:8 9
false: ?
)? @
,@ A
	ProductId 
= 
table  %
.% &
Column& ,
<, -
int- 0
>0 1
(1 2
nullable2 :
:: ;
false< A
)A B
,B C
Amount   
=   
table   "
.  " #
Column  # )
<  ) *
int  * -
>  - .
(  . /
nullable  / 7
:  7 8
false  9 >
)  > ?
,  ? @
Price!! 
=!! 
table!! !
.!!! "
Column!!" (
<!!( )
decimal!!) 0
>!!0 1
(!!1 2
nullable!!2 :
:!!: ;
false!!< A
)!!A B
}"" 
,"" 
constraints## 
:## 
table## "
=>### %
{$$ 
table%% 
.%% 

PrimaryKey%% $
(%%$ %
$str%%% 6
,%%6 7
x%%8 9
=>%%: <
x%%= >
.%%> ?
OrderDetailId%%? L
)%%L M
;%%M N
table&& 
.&& 

ForeignKey&& $
(&&$ %
name'' 
:'' 
$str'' >
,''> ?
column(( 
:(( 
x((  !
=>((" $
x((% &
.((& '
OrderId((' .
,((. /
principalTable)) &
:))& '
$str))( 0
,))0 1
principalColumn** '
:**' (
$str**) 2
,**2 3
onDelete++  
:++  !
ReferentialAction++" 3
.++3 4
Cascade++4 ;
)++; <
;++< =
table,, 
.,, 

ForeignKey,, $
(,,$ %
name-- 
:-- 
$str-- B
,--B C
column.. 
:.. 
x..  !
=>.." $
x..% &
...& '
	ProductId..' 0
,..0 1
principalTable// &
://& '
$str//( 2
,//2 3
principalColumn00 '
:00' (
$str00) 4
,004 5
onDelete11  
:11  !
ReferentialAction11" 3
.113 4
Cascade114 ;
)11; <
;11< =
}22 
)22 
;22 
migrationBuilder44 
.44 
CreateIndex44 (
(44( )
name55 
:55 
$str55 /
,55/ 0
table66 
:66 
$str66 %
,66% &
column77 
:77 
$str77 !
)77! "
;77" #
migrationBuilder99 
.99 
CreateIndex99 (
(99( )
name:: 
::: 
$str:: 1
,::1 2
table;; 
:;; 
$str;; %
,;;% &
column<< 
:<< 
$str<< #
)<<# $
;<<$ %
}== 	
	protected?? 
override?? 
void?? 
Down??  $
(??$ %
MigrationBuilder??% 5
migrationBuilder??6 F
)??F G
{@@ 	
migrationBuilderAA 
.AA 
	DropTableAA &
(AA& '
nameBB 
:BB 
$strBB $
)BB$ %
;BB% &
migrationBuilderDD 
.DD 
	DropTableDD &
(DD& '
nameEE 
:EE 
$strEE 
)EE 
;EE  
}FF 	
}GG 
}HH Ö

/C:\Users\micuc\source\repos\ShopBeer\Program.cs
	namespace

 	
ShopBeer


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ’&
/C:\Users\micuc\source\repos\ShopBeer\Startup.cs
	namespace 	
ShopBeer
 
{ 
public 

class 
Startup 
{ 
private 
IConfigurationRoot "
_configurationRoot# 5
;5 6
public 
Startup 
( 
IWebHostEnvironment *
hostingEnvironment+ =
)= >
{ 	
_configurationRoot 
=  
new! $ 
ConfigurationBuilder% 9
(9 :
): ;
. 
SetBasePath 
( 
hostingEnvironment /
./ 0
ContentRootPath0 ?
)? @
. 
AddJsonFile 
( 
$str /
)/ 0
.   
Build   
(   
)   
;   
}!! 	
public## 
void## 
ConfigureServices## %
(##% &
IServiceCollection##& 8
services##9 A
)##A B
{$$ 	
services&& 
.&& 
AddDbContext&& !
<&&! "
AppDbContext&&" .
>&&. /
('' 
options'' 
=>'' 
options'' #
.''# $
UseSqlServer''$ 0
(''0 1
_configurationRoot''1 C
.''C D
GetConnectionString''D W
(''W X
$str''X k
)''k l
)''l m
)''m n
;''n o
services)) 
.)) 
AddTransient)) !
<))! "
IProductRepository))" 4
,))4 5
ProductRepository))6 G
>))G H
())H I
)))I J
;))J K
services** 
.** 
AddTransient** !
<**! "
ICategoryRepository**" 5
,**5 6
CategoryRepository**7 I
>**I J
(**J K
)**K L
;**L M
services,, 
.,, 
AddSingleton,, !
<,,! " 
IHttpContextAccessor,," 6
,,,6 7
HttpContextAccessor,,8 K
>,,K L
(,,L M
),,M N
;,,N O
services-- 
.-- 
	AddScoped-- 
(-- 
sp-- !
=>--" $
ShoppingCart--% 1
.--1 2
GetCart--2 9
(--9 :
sp--: <
)--< =
)--= >
;--> ?
services// 
.// 
AddMvc// 
(// 
)// 
;// 
services00 
.00 
AddMemoryCache00 #
(00# $
)00$ %
;00% &
services11 
.11 

AddSession11 
(11  
)11  !
;11! "
}22 	
public44 
void44 
	Configure44 
(44 
IApplicationBuilder44 1
app442 5
,445 6
IWebHostEnvironment447 J
env44K N
,44N O
ILoggerFactory44P ^
loggerFactory44_ l
)44l m
{55 	
if66 
(66 
env66 
.66 
IsDevelopment66 !
(66! "
)66" #
)66# $
{77 
app88 
.88 %
UseDeveloperExceptionPage88 -
(88- .
)88. /
;88/ 0
}99 
app;; 
.;; %
UseDeveloperExceptionPage;; )
(;;) *
);;* +
;;;+ ,
app<< 
.<< 
UseStatusCodePages<< "
(<<" #
)<<# $
;<<$ %
app== 
.== 
UseHttpsRedirection== #
(==# $
)==$ %
;==% &
app>> 
.>> 
UseStaticFiles>> 
(>> 
)>>  
;>>  !
app?? 
.?? 

UseSession?? 
(?? 
)?? 
;?? 
appCC 
.CC 

UseRoutingCC 
(CC 
)CC 
;CC 
appEE 
.EE 
UseEndpointsEE 
(EE 
	endpointsEE &
=>EE' )
{FF 
	endpointsGG 
.GG 
MapControllerRouteGG ,
(GG, -
nameHH 
:HH 
$strHH #
,HH# $
patternII 
:II 
$strII E
)IIE F
;IIF G
	endpointsJJ 
.JJ 
MapRazorPagesJJ '
(JJ' (
)JJ( )
;JJ) *
	endpointsLL 
.LL 
MapControllerRouteLL ,
(LL, -
nameMM 
:MM 
$strMM *
,MM* +
patternNN 
:NN 
$strNN H
)NNH I
;NNI J
	endpointsOO 
.OO 
MapRazorPagesOO '
(OO' (
)OO( )
;OO) *
}PP 
)PP 
;PP 
DbInitializerRR 
.RR 
SeedRR 
(RR 
appRR "
)RR" #
;RR# $
}SS 	
}TT 
}UU ·
@C:\Users\micuc\source\repos\ShopBeer\ViewModels\HomeViewModel.cs
	namespace 	
ShopBeer
 
. 

ViewModels 
{ 
public		 

class		 
HomeViewModel		 
{

 
public 
IEnumerable 
< 
Product "
>" #
Product$ +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} ì
GC:\Users\micuc\source\repos\ShopBeer\ViewModels\ProductListViewModel.cs
	namespace 	
ShopBeer
 
. 

ViewModels 
{ 
public		 

class		  
ProductListViewModel		 %
{

 
public 
IEnumerable 
< 
Product "
>" #
Products$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
string 
CurrentCategory %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} Í
HC:\Users\micuc\source\repos\ShopBeer\ViewModels\ShoppingCartViewModel.cs
	namespace 	
ShopBeer
 
. 

ViewModels 
{ 
public		 

class		 !
ShoppingCartViewModel		 &
{

 
public 
ShoppingCart 
ShoppingCart (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
decimal 
ShoppingCartTotal (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ¡
?C:\Users\micuc\source\repos\ShopBeer\Views\Home\Index.cshtml.cs
	namespace 	
ShopBeer
 
. 
Views 
. 
Home 
{		 
public

 

class

 

IndexModel

 
:

 
	PageModel

 '
{ 
public 
void 
OnGet 
( 
) 
{ 	
} 	
} 
} 