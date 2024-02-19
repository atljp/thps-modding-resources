goal_bike_goals = [
    {
        goal_script = goal_bike_goals_basics
        goal_params = {
            shot_text = [ 'Wiêc uwa¿asz, ¿e potrafisz jedziæ na BMXie? Zap³acê ci, jeli zdo³asz nauczyæ siê moich trików. Zacznijmy od podstaw.' 'Najwiêksz¹ ró¿nic¹ miêdzy desk¹, a rowerem, jest to, ¿e do jazdy na rowerze, u¿ywamy \bk i \bl.' 'Rowerem kierujesz za pomoc¹ \bk.  Spróbuj przejechaæ siê przez 30 sekund, bez upadania.' 'Przytrzymaj \b3 by peda³owaæ.  Zwolnij \b3 by skoczyæ.  \bk by sterowaæ.  Przytrzymaj \bf by siê zatrzymaæ.  Rób lizgi za pomoc¹ \bf i Lewo lub Prawo na \bk.' ]
            goal_text = 'Przytrzymaj \b3 by peda³owaæ. Zwolnij \b3 by skoczyæ.  \bk by sterowaæ.  Przytrzymaj \bf by siê zatrzymaæ.  Przytrzymaj \bf i lewo albo prawo, by wejæ w lizg.'
            success_text = 'Niele. Pamiêtaj, ¿e mo¿esz w ka¿dej chwili zeskoczyæ z roweru wciskaj¹c \mm. Nie mo¿esz tego zrobiæ jedynie podczas podejmowania wyzwania.'
            igc_name = 'basics'
        }
    }
    {
        goal_script = goal_bike_goals_tailwhip
        goal_params = {
            shot_text = [ 'Hmm, mo¿e jednak nie jeste do dupy.  Dobra, podniemy poprzeczkê.  Za³o¿ê siê o 20 dolców, ¿e nie potrafisz wykonaæ Tailwhipa.' '\b3 by skoczyæ, potem prawo lub lewo na \bl by wykonaæ Tailwhip' 'Poka¿ teraz, jak robisz dla mnie trzy razy tailwhip, twardzielu.' ]
            goal_text = '\b3 by skoczyæ, potem prawo lub lewo na \bl by wykonaæ Tailwhip'
            igc_name = 'tailwhip'
        }
    }
    {
        goal_script = goal_bike_goals_crankflip
        goal_params = {
            shot_text = [ 'Dobra, szybko chwytasz. A teraz spróbuj tego.   Dostaniesz 20 dolców, jeli opanujesz Crankflipa.' '\b3 by podskoczyæ, potem do góry z \bl by zrobiæ Crankflip.' 'Zobaczmy, jak wykrêcasz 3 razy Crankflip, panie Freestyler.' ]
            goal_text = '\b3 by skoczyæ, potem rusz siê w górê wciskaj¹c \bl, a wykonasz Crankflip.'
            igc_name = 'crankflip'
        }
    }
    {
        goal_script = goal_bike_goals_barspin
        goal_params = {
            shot_text = [ 'Ziom, jedziesz jak burza! Mam co dla ciebie.  Dostaniesz 20 dolców, jeli wysma¿ysz Barspina.' 'Wyskocz za pomoc¹ \b3, nastêpnie wcinij dó³ na \b1, by wykonaæ Barspin.' 'Wyczesz 3 razy Barspin, cwaniaczku.' ]
            goal_text = '\b3 by podskoczyæ, nastêpnie dó³ na \bl by zrobiæ Barspin'
            igc_name = 'barspin'
        }
    }
    {
        goal_script = goal_bike_goals_xup
        goal_params = {
            shot_text = [ 'Dobra, poka¿, co jeszcze potrafisz. Szeleszcz¹ca dwudziestka dla ciebie, jeli poka¿esz mi kilka X-Upów.' 'Teraz co innego. Porobimy triki w powietrzu. A X-up to jeden z nich.' '\b3 by skoczyæ, potem \b2 by zrobiæ X-Up. Poka¿ mi 3 takie, a bêdê pod wra¿eniem.' ]
            goal_text = '¯eby skoczyæ, wcinij \b3 a potem \b2 by wykonaæ X-Up.'
            igc_name = 'xup'
        }
    }
    {
        goal_script = goal_bike_goals_tabletop
        goal_params = {
            shot_text = [ 'No proszê, wymiatasz.  Mam dla ciebie wiêcej kasy, jeli poka¿esz porz¹dny Tabletop.' 'Ten jest trochê inny, mo¿esz zrobiæ kilka trików w powietrzu, na przyk³ad Tabletopa.' 'Skocz, wciskaj¹c \b3, a potem wcinij \b1 by wykonaæ Tabletop.  Jeli zrobisz takie 3, poka¿esz, ¿e masz to w ma³ym palcu.' ]
            goal_text = '\b3 by skoczyæ, potem \b1 by zrobiæ Tabletop.'
            igc_name = 'tabletop'
        }
    }
    {
        goal_script = goal_bike_goals_backwards
        goal_params = {
            shot_text = [ 'Dobra, jeste gotowy na co nowego.  Jeli poka¿esz, ¿e potrafisz jedziæ ty³em, chêtnie rozstanê siê z 20 dolcami.' 'Obserwuj wska¿nik i utrzymuj go w rodku, by jechaæ prosto. Mo¿esz ustawiæ siê znów przodem na ró¿ne sposoby.' '\b3 by skoczyæ, potem przytrzymaj prawo lub lewo na \bk by obróciæ siê o 180 stopni.' 'Albo mo¿esz obróciæ siê na tylnim kole, przytrzymuj¹c \mr.' ]
            goal_text = 'Podskocz i obróæ siê o 180 stopni, by jechaæ do ty³u. Zrób to znowu albo przytrzymaj \mr by ustawiæ siê znów przodem.'
            igc_name = 'backwards'
        }
    }
    {
        goal_script = goal_bike_goals_spins
        goal_params = {
            shot_text = [ 'Dobra, zróbmy parê trików. Sypnê wiêksz¹ kas¹, jeli udadz¹ ci siê te numery w powietrzu.' 'Zacznijmy od 360ki.  Postaraj siê szybko obróciæ, jeli chcesz zrobiæ wiêcej, ni¿ tylko pó³obrót.' 'Wybij siê z rampy, w drodze wciskaj¹c \b3, a nastêpnie przytrzymaj \mo i lewo lub prawo na \bk.' 'Zrób dla mnie trzy 360-ki, a odpalê ci 20 dolców. Pamiêtaj: nie liczy siê, dopóki znów nie bêdziesz jecha³ do przodu.' ]
            goal_text = 'Obróæ siê szybko naciskaj¹c \mo trzymaj¹c lewy lub prawy z \bk, by zrobiæ 360-kê.'
            igc_name = 'spins'
        }
    }
    {
        goal_script = goal_bike_goals_flips
        goal_params = {
            shot_text = [ 'Dobra, postawmy to na g³owie. Podci¹gnij siê nieco w trikach, a sp³ynie ci nieco wiêcej kasy.' 'Flipy s¹ jak obroty 360.  Musisz zrobiæ je szybko, ¿eby wykonaæ pe³en obrót.' 'Zacznij na rampie wciskaj¹c \b3 jad¹c w górê, a potem przytrzymaj \mo i górê lub dó³ na \bk.' 'Wysma¿ 3 flipy, a 20 zielonych bêdzie twoje. Pamiêtaj, jeli po wyl¹dowaniu nie pojedziesz do przodu, nie zaliczê ci flipa.' ]
            goal_text = 'Aby wykonaæ flipa, daj górê, lub dó³ na \bk i szybko zakrêæ \mo.'
            igc_name = 'flips'
        }
    }
    {
        goal_script = goal_bike_goals_flairs
        goal_params = {
            shot_text = [ 'Dobra, to tutaj jest TRUDNE! Nie uwierzê w twoje zdolnoci, dopóki kilka razy nie zrobisz Flair. ' 'Flair to Backflip po³¹czony z obrotem o 180 stopni, wiêc l¹dujesz normalnie. Mo¿esz zrobiæ to jednoczenie, albo najpierw wykonaæ backflipa, a potem 180tkê tu¿ przed l¹dowaniem.' 'Aby wykonaæ szybki obrót, wybij siê wysoko, wychyl \bk do ty³u, na ukos i przytrzymaj \mo.' 'Jeli uda ci siê wykonaæ takie 2, rzucê ci t¹ 20tkê.' ]
            goal_text = 'Zrób szybko Backflip trzymaj¹c \mo, a potem wychyl siê do ty³u wciskaj¹c \bk i zrób Flair (albo najpierw Backflip, a potem obrót o 180)'
            igc_name = 'flairs'
        }
    }
    {
        goal_script = goal_bike_goals_double_crankflip
        goal_params = {
            shot_text = [ 'Có¿, znasz ju¿ ca³kiem sporo trików, ale za³o¿ê siê o 20 dolarów, ¿e nie podwoisz swoich trików powietrznych.' 'Niektóre triki mo¿esz przytrzymaæ, by uzyskaæ podwójn¹ lub potrójn¹ wersjê. Crankflip jest jednym z nich.' 'Wyskocz z rampy, przytrzymaj górê i \bl by zrobiæ Double a nawet Triple Crankflip.' 'Jeli chcesz tê kasê, poka¿ mi trzy Double Crankflipy.' ]
            goal_text = 'Skocz wysoko, a potem przytrzymaj górê wciskaj¹c \bl, a wykonasz Double Crankflip.'
            igc_name = 'double_crankflip'
        }
    }
    {
        goal_script = goal_bike_goals_double_barspin
        goal_params = {
            shot_text = [ 'Dobra, szybko chwytasz. Jak chcesz zarobiæ wiêcej, poka¿ jakie jeszcze triki potrafisz wykonaæ podwójnie.' 'Mo¿esz przytrzymaæ niektóre triki powietrzne, by wykonaæ je podwójnie, a nawet potrójnie. Jednym z tych trików jest Barspin.' 'Wybij siê wysoko z rampy, a potem przytrzymaj Dó³ na \bl ¿eby wykonaæ Double, a nawet Triple Barspin.' '3 Double Barspiny dadz¹ ci 20 dolarów wiêcej.' ]
            goal_text = 'Wybij siê wysoko, a nastêpnie przytrzymaj dó³ na \bl, a wykonasz Double Barspin.'
            igc_name = 'double_barspin'
        }
    }
    {
        goal_script = goal_bike_goals_double_tailwhip
        goal_params = {
            shot_text = [ 'Có¿, widzê, ¿e sypiesz podwójnymi trikami na lewo i prawo, ale za³o¿ê siê o 20 dolców, ¿e nie wykonasz Double Tailwhipa.' 'Niektóre triki mo¿esz przytrzymaæ, by uzyskaæ podwójn¹ lub potrójn¹ wersjê. Tailwhip jest jednym z nich.' 'Wyskocz wysoko z rampy, po czym przytrzymaj prawy lub lewy na \bl, by zrobiæ Double, lub nawet Triple Tailwhip' 'Zobaczmy, jak wykonujesz 3 Double Tailwhipy, a kasa bêdzie twoja.' ]
            goal_text = 'Wybij siê wysoko, a nastêpnie wychyl \bl w prawo lub lewo, a wykonasz Double Tailwhip.'
            igc_name = 'double_tailwhip'
        }
    }
    {
        goal_script = goal_bike_goals_manuals
        goal_params = {
            shot_text = [ 'Niechêtnie to przyznajê, ale jak na skejta, nie jeste taki z³y. Jeli opanujesz triki na flatlandzie, bêdê mia³ dla ciebie wiêcej kasy.' 'Manuale s¹ niezwykle wa¿ne.  Wykonujesz je, wychylaj¹c /bk do ty³u i utrzymuj¹c równowagê, wychylaj¹c j¹ w górê i dó³.' 'Nose Manual to to samo, tylko ¿e naciskacz przód, by go wykonaæ. Poka¿, jak utrzymujesz jaki manual przez 5 sekund.' ]
            goal_text = 'Wcinij górê lub dó³ na \bk, aby rozpocz¹æ manual.  Utrzymaj go przez 5 sekund.'
            igc_name = 'manuals'
        }
    }
    {
        goal_script = goal_bike_goals_land_manual
        goal_params = {
            shot_text = [ 'Idzie ci niele.  Ale za³o¿ê siê o 20 dolców, ¿e nie wykonasz tego w combo.' 'Tak jak i w przypadku deski, jad¹c na rowerze tak¿e mo¿na kontynuowaæ combo, l¹duj¹c manualem. Wykonujesz go, wciskaj¹c górê, lub dó³ na \bk.' 'Wyskocz za pomoc¹ \b3 i wykonaj Tabletop, wciskaj¹c \b1, a nastêpnie wychyl \bk do ty³u, by wyl¹dowaæ Manualem.' ]
            goal_text = 'Nacinij \b3 by skoczyæ, potem \b1 aby zrobiæ Tabletop, a potem do ty³u przyciskiem \bk by zrobiæ manual.'
            igc_name = 'land_manual'
        }
    }
    {
        goal_script = goal_bike_goals_manual_decade
        goal_params = {
            shot_text = [ 'Dobra, teraz poczeszemy triki w manualu. Jeli uda ci siê wysma¿yæ Decade, dostaniesz ode mnie 20 dolców.' 'Odchyl siê z \bk do Manuala, póniej rusz siê w lewo albo prawo na \bl by zrobiæ Decade.' 'Wykonaj 3 Dekady, a kasa bêdzie twoja, szefuniu.' ]
            goal_text = 'Wykonaj Manuala, odchylaj¹c siê do ty³u za pomoc¹ \bk, a potem wcinij lewo lub prawo na \bl.'
            igc_name = 'manual_decade'
        }
    }
    {
        goal_script = goal_bike_goals_manual_crankflip
        goal_params = {
            shot_text = [ 'Dobra, wiêcej manuali.  Dostaniesz kolejne dwie dychy za 3 Manual Crankflipy.' 'Odchyl siê u¿ywaj¹c \bk by zrobiæ Manual, potem wcinij górê na \bl.' 'Zrób 3 Manual Crankflipy za du¿¹ forsê.' ]
            goal_text = 'Odchyl siê u¿ywaj¹c \bk by zrobiæ Manual, potem wcinij górê na \bl.'
            igc_name = 'manual_crankflip'
        }
    }
    {
        goal_script = goal_bike_goals_manual_barspin
        goal_params = {
            shot_text = [ 'Wow, a co teraz? Mo¿e Manual Barspin? Wykonanie 3 daje ci 20 koci.' 'Wykonaj manuala, pochylaj¹c siê do ty³u za pomoc¹ \bk. Nastêpnie wcinij dó³ na \bl.' 'Jeli wykonasz 3 Manual barspiny, kasa bêdzie twoja.' ]
            goal_text = 'Wykonaj manuala, pochylaj¹c siê do ty³u za pomoc¹ \bk. Nastêpnie wcinij dó³ na \bl.'
            igc_name = 'manual_barspin'
        }
    }
    {
        goal_script = goal_bike_goals_manual_xup
        goal_params = {
            shot_text = [ 'Dobra, oto nastêpny trik manual. Wchodzê z wiêksz¹ kas¹, jeli potrafisz zrobiæ Manual X-Up.' 'Naciskaj¹c \bk ustaw siê do Manuala, a potem wcinij \b2 by zrobiæ Manual X-Up.' 'Zrób 3 Manual X-upy i bêdziesz bogatszy o 20 dolców.' ]
            goal_text = 'Odchyl siê do ty³u \bk, by zrobiæ Manual, potem uderz \b2.'
            igc_name = 'manual_xup'
        }
    }
    {
        goal_script = goal_bike_goals_nose_manual_tailwhip
        goal_params = {
            shot_text = [ 'Hmm, a co powiesz na parê Nose Manuali? Wyczesz parê Tailwhipów podczas Nose Manuala, a ja wyskoczê z kasy.' 'Przechyl siê  do przodu wciskaj¹c \bk, wykonasz Nose Manual, nastêpnie rusz siê w prawo lub lewo na \bl, by wykonaæ Flatland Whip.' 'Zrób 3 razy Flatland Whip i zgarnij 20 dolców.' ]
            goal_text = 'Odchyl siê do ty³u z \bk, by zrobiæ Nose Manual, potem Lewo lub Prawo na \bl.'
            igc_name = 'nose_manual_tailwhip'
        }
    }
    {
        goal_script = goal_bike_goals_nose_manual_crankflip
        goal_params = {
            shot_text = [ 'Co powiesz na kolejnego Nose Manuala?  Jeli wysma¿ysz parê Crankflipów podczas Nose Manuala, dostaniesz jeszcze parê zielonych.' 'Pochyl siê u¿ywaj¹c \bk by zrobiæ Nose Manual, potem wcinij górê na \bl by zrobiæ Crankflipa.' 'Wykonaj 3 razy Nose Manual Crankflip, a odchodzisz z kolejnymi 20 dolcami.' ]
            goal_text = 'Pochyl siê u¿ywaj¹c \bk by zrobiæ Nose Manual, potem wcinij górê na \bl by zrobiæ Crankflipa.'
            igc_name = 'nose_manual_crankflip'
        }
    }
    {
        goal_script = goal_bike_goals_nose_manual_endo
        goal_params = {
            shot_text = [ 'Powiem ci co. Mo¿esz te¿ zacz¹æ Nose Manuala, wykonuj¹c Endo. Mylisz, ¿e dasz radê?' 'Podczas jazdy przytrzymaj \be (przednie hamulce), a zwolnisz i zaczniesz Endo. Nie puszczaj¹c \be, utrzymuj równowagê za pomoc¹ \bk.' 'Zrób 3 razy Endo, a kasa jest twoja.' ]
            goal_text = 'Podczas jazdy, przytrzymaj \be (przednie hamulce), a wykonasz Endo. Balansuj za pomoc¹ \bk.'
            igc_name = 'nose_manual_endo'
        }
    }
    {
        goal_script = goal_bike_goals_nose_manual_pivot
        goal_params = {
            shot_text = [ 'A to ostatni trik typu Nose manual. Dorzucê kolejne 20 dolców, jeli uda ci siê wykonaæ Nose manual pivot.' 'Wykonaj Nose Manuala, wychylaj¹c siê do przodu za pomoc¹ \bk, a nastêpnie wcinij \mr, by obróciæ siê i jechaæ ty³em podczas Nose Manuala.' 'Wykonaj trzy Nose Manual Pivoty, a 20 dolców bêdzie twoje.' ]
            goal_text = 'Wykonaj Nose Manuala, wychylaj¹c siê do przodu za pomoc¹ \bk, a nastêpnie wcinij \mr, by obróciæ siê i jechaæ ty³em podczas Nose Manuala.'
            igc_name = 'nose_manual_pivot'
        }
    }
    {
        goal_script = goal_bike_goals_grind_double_peg
        goal_params = {
            shot_text = [ 'A teraz obczajmy twoje grindy. Dostaniesz dwie dychy, jak wykonasz Double Pega.' 'Zbli¿aj¹c siê do raila, wyskocz wciskaj¹c \b3, a nastêpnie przegrinduj, naciskaj¹c \b0. Jeli nie przechylisz siê do przodu, lub ty³u za pomoc¹ \bk, wykonasz Double Pega.' '2 double peg grindy za 20 dolców.  Po dziesiêæ za sztukê.' ]
            goal_text = '\b3 by podskoczyæ ko³o szyny, potem \b0 by zrobiæ Double Peg Grind.'
            igc_name = 'grind_double_peg'
        }
    }
    {
        goal_script = goal_bike_goals_grind_icepick
        goal_params = {
            shot_text = [ 'Teraz podci¹gnij nieco grindy. Obrót wy³¹cznie na tylnym ko³ku to Icepick Grind. Zrób kilka.' '\b3 by podskoczyæ ko³o szyny, potem odchyl siê do ty³u z \bk, a potem \b0 by zrobiæ Icepick Grind.' 'Zrób 2 razy Icepick Grind, a sypnê groszem.' ]
            goal_text = 'Wyskocz \b3 w pobli¿u raila, potem maksymalnie wychyl siê do ty³u \bk i wcinij \b0 ¿eby wykonaæ Icepick Grind.'
            igc_name = 'grind_icepick'
        }
    }
    {
        goal_script = goal_bike_goals_grind_toothpick
        goal_params = {
            shot_text = [ 'Kontynuujmy naukê grindów.  Grind na przedniej podpórce nazywamy Toothpick grindem. A teraz zobaczmy, jak go wykonujesz.' 'Zbli¿aj¹c siê do raila, wyskocz wciskaj¹c \b3, nastêpnie wychyl siê maksymalnie do przodu za pomoc¹ \bk i wcinij \b0, a wykonasz Toothpick grinda.' 'Jak chcesz wiêcej kasy, to wykonaj 2 Toothpick Grindy.' ]
            goal_text = '\b3 by podskoczyæ ko³o szyny, potem w pe³ni pochyl siê do przodu wciskaj¹c \bk a potem nacinij \b0 by wykonaæ Toothpick Grind.'
            igc_name = 'grind_toothpick'
        }
    }
    {
        goal_script = goal_bike_goals_grind_feeble
        goal_params = {
            shot_text = [ 'Dobra, mam dla ciebie jeszcze parê grindów.  Grindowanie tylni¹ podpórk¹, podczas gdy przednie ko³o jedzie po ziemi, nazywamy Feeble Grindem.' '\b3 ¿eby podskoczyæ ko³o szyny, nastêpnie pochyl siê naciskaj¹c \bk a potem \b0 ¿eby wykonaæ Feeble Grind.' 'Dam ci dwie dychy za dwa Feeble Grindy.' ]
            goal_text = 'Wyskocz (\b3) w pobli¿u raila, nastêpnie wychyl siê o po³owê do ty³u (\bk) i wcinij \b0, by wykonaæ Feeble Grinda.'
            igc_name = 'grind_feeble'
        }
    }
    {
        goal_script = goal_bike_goals_grind_smith
        goal_params = {
            shot_text = [ 'Dobra, jeszcze jeden grind, który musisz znaæ. M³ynek na przednim ko³ku i jazda na tylnym kole to Smith Grind.' 'Zbli¿aj¹c siê do raila, wyskocz wciskaj¹c \b3, a nastêpnie wychyl siê za pomoc¹ \bk i  wykonaj Smith Grind, wciskaj¹c \b0.' 'Poka¿ 2 Smith Grindy, a te 20 dolców jest twoje.' ]
            goal_text = 'Wyskocz w pobli¿u raila, wciskaj¹c  \b3, nastêpnie za pomoc¹ \bk wychyl siê do po³owy do przodu i wcinij \b0, by wykonaæ Smith Grind.'
            igc_name = 'grind_smith'
        }
    }
    {
        goal_script = goal_bike_goals_grind_stall
        goal_params = {
            shot_text = [ 'Hej, nie zapominajmy o stallach.  Mo¿esz wykonaæ stalla podczas ka¿dego grinda - zupe³nie jak na desce. Wystarczy przytrzymaæ \bh.' '\b3 by podskoczyæ ko³o szyny, potem przytrzymaj \m4 i uderz w \b0 by wykonaæ grind.' 'U³atwiê ci to. Wykonaj 5 double pegów, a dam ci 20 dolców.' ]
            goal_text = '\b3 by podskoczyæ ko³o szyny, potem przytrzymaj \m4 i uderz w \b0 by wykonaæ grind.'
            igc_name = 'grind_stall'
        }
    }
    {
        goal_script = goal_bike_goals_tiretap
        goal_params = {
            shot_text = [ 'Przejdmy do Tire tapów.  Mo¿esz wskakiwaæ na ró¿ne rzeczy, balansuj¹c na tylnim kole. Wystarczy w powietrzu wcisn¹æ \bf.' 'Wje¿d¿aj¹c na rampê, wcinij \b3, potem \bf w powietrzu przy pó³ce, a wyrównasz lot i wyl¹dujesz na tylnim kole.' 'Utrzymaj równowagê u¿ywaj¹c \bk, potem wcinij \b3 by skoczyæ do ty³u. U¿yj \bk by odwróciæ siê ku rampie.' 'Wykonaj jeszcze 2 takie wintuszki, a dostaniesz wiêcej kasy.' ]
            goal_text = 'Wyskocz z rampy, potem \bf wyl¹duj na tylnym kole.'
            alt_shot_text = [ 'Przejdmy do Tire Tapów.  Mo¿esz wskakiwaæ na ró¿ne rzeczy, balansuj¹c na tylnim kole. Wystarczy w powietrzu wcisn¹æ \b4 + \bf.' 'Wje¿d¿aj¹c na quarter pipe\'a, wcinij \b3, potem \bk a na koniec wyrównaj i wyl¹duj na tylnim kole, wciskaj¹c \bf w powietrzu przy pó³ce.' 'Utrzymaj równowagê u¿ywaj¹c \bk, potem wcinij \b3 by skoczyæ do ty³u. U¿yj \bk by odwróciæ siê ku rampie.' 'Wykonaj jeszcze 2 takie wintuszki, a dostaniesz wiêcej kasy.' ]
            alt_goal_text = 'Wyskocz z rampy, wcinij dó³ na \bk + \bf i wyl¹duj na tylnim kole.'
            igc_name = 'tiretap'
        }
    }
    {
        goal_script = goal_bike_goals_nosepick
        goal_params = {
            shot_text = [ 'Dobra, teraz sprawd Nose Picka.  Jak chcesz wyl¹dowaæ na czym, balansuj¹c na przednim kole, wystarczy, ¿e w powietrzu, wciniesz \be.' '\b3 jad¹c ramp¹, potem \be ko³o parapetu w powietrzu, by zatrzymaæ siê i wyl¹dowaæ na przednim kole.' 'Utrzymaj równowagê u¿ywaj¹c \bk, potem wcinij \b3 by skoczyæ do ty³u. U¿yj \bk by odwróciæ siê ku rampie.' 'Kopsnê ci 20 baksów, jeli zrobisz dwa takie.' ]
            goal_text = 'Wyskocz z rampy, potem \be wyl¹duj na przednim kole.'
            alt_shot_text = [ 'Ok, teraz spróbuj zrobiæ Nose Pick. Mo¿esz l¹dowaæ na przednich kó³kach naciskaj¹c \b7 + bf bêd¹c w powietrzu.' 'Wje¿d¿aj¹c na rampê, wcinij \b3, potem wcinij górê na \bk i daj \bf w powietrzu przy pó³ce, a wyrównasz lot i wyl¹dujesz na przednim kole.' 'Utrzymaj równowagê u¿ywaj¹c \bk, potem wcinij \b3 by skoczyæ do ty³u. U¿yj \bk by odwróciæ siê ku rampie.' 'Kopsnê ci 20 baksów, jeli zrobisz dwa takie.' ]
            alt_goal_text = 'Wybij siê z rampy, wcinij górê na \bk + \bf i wyl¹duj u szczytu na przednim kole.'
            igc_name = 'nosepick'
        }
    }
    {
        goal_script = goal_bike_goals_acid_drop
        goal_params = {
            shot_text = [ 'To bêdzie ³atwe.  Mo¿esz wykonywaæ bank dropy tak samo, jak na desce. Wystarczy tylko wcisn¹æ \ml nad krawêdzi¹.' 'Wiesz, jak to dzia³a.  20 dolców za takie 3.' ]
            goal_text = 'Zeskocz i wykonaj /ml bank drop'
            igc_name = 'acid_drop'
        }
    }
    {
        goal_script = goal_bike_goals_spine_transfer
        goal_params = {
            shot_text = [ 'Na rowerze mo¿na robiæ tire tapy tak samo jak na desce. Wystarczy wcisn¹æ \ml po wybiciu siê z dwóch, z³¹czonych ty³em ramp.' 'Znajd ustawione ty³em do siebie rampy i nacinij \ml kiedy zeskoczysz z jednej, ¿eby zrobiæ Spine Transfer na drug¹.' 'S¹dzê, ¿e 20 dolców to dobra cena za to, ¿e trzy razy zrobisz Spine Transfer.' ]
            goal_text = 'Wybij siê z dwóch, z³¹czonych ty³em ramp i wcinij /ml, a wykonasz nad nimi Spine Transfer.'
            igc_name = 'spine_transfer'
        }
    }
    {
        goal_script = goal_bike_goals_wallplant
        goal_params = {
            shot_text = [ 'Wall Plant to zdecydowanie co dla ciebie. To jak zwyk³a jazda, po prostu nacinij \b3 bêd¹c blisko ciany.' 'To takie proste, ¿e musisz zrobiæ piêæ ¿eby dostaæ ode mnie forsê.' ]
            goal_text = 'Jed prosto na cianê i skocz \b3, po czym \b3 zanim trafisz w cianê.'
            igc_name = 'wallplant'
        }
    }
    {
        goal_script = goal_bike_goals_tailtap
        goal_params = {
            shot_text = [ 'Potrafisz zrobiæ Wall Plant, ale czy potrafisz zrobiæ go ty³em? Podjed do ciany ty³em by wykonaæ Tail Tap.' 'Jed prosto na cianê. Wyskocz i obróæ siê o 180 stopni i zanim uderzysz w cianê, wyskocz ponownie i wcinij \b3, a zrobisz Tail tapa.' 'To bêdzie trudne.  Zrób takie dwa, a ja siê wysypiê z kasy.' ]
            goal_text = 'Jad¹c ty³em, zbli¿ siê do ciany i wyskocz, naciskaj¹c \b3. Nastêpnie, zanim uderzysz w cianê, ponownie wcinij \b3.'
            igc_name = 'tailtap'
        }
    }
    {
        goal_script = goal_bike_goals_wallride
        goal_params = {
            shot_text = [ 'Kolejna prosta rzecz - jak normalne je¿d¿enie. Mo¿esz wykonaæ Wallride skacz¹c pod k¹tem i przytrzymuj¹c \b0.' 'Jeli chcesz te 20 papierów, musisz wykonaæ 5 takich ³atwych.' ]
            goal_text = 'Zbli¿ siê pod k¹tem do ciany i wyskocz, wciskaj¹c \b3 i zanim uderzysz w cianê, wcinij \b0.'
            igc_name = 'wallride'
        }
    }
    {
        goal_script = goal_bike_goals_backwards_wallride
        goal_params = {
            shot_text = [ 'Znasz ju¿ Wallride, ale czy znasz ju¿ odwrócony?  Zrób skok 180 przed Wallride, by zrobiæ odwrócony Wallride.' 'Podjed do ciany pod k¹tem. Wyskocz z pó³obrotem i wcinij \b0 zanim uderzysz w cianê, a wykonasz Wallride.' 'To bêdzie trudne.  Zrób takie dwa, a ja siê wysypiê z kasy.' ]
            goal_text = 'Wskocz 180 na cianê, potem \b0 zanim trafisz w cianê, by zrobiæ odwrócony Wallride.'
            success_text = 'licznie. Masz tu 20 dolców. Nauczy³e siê ode mnie wszystkiego, teraz ruszaj!'
            igc_name = 'backwards_wallride'
        }
    }
]
goal_bike_goals_max_goals = 37
goal_bike_goals_num_goal_peds = 10
goal_bike_goals_last_goal_ped = -1

script goal_bike_goals_add_next_goal 
    Block \{ untilevent = goal_cam_anim_done }
    wait \{ 2 gameframes }
    CareerFunc \{ func = GetCurrentBikeTrainingGoal }
    CareerFunc func = SetCurrentBikeTrainingGoal params = {current_bike_training_goal = (<current_bike_training_goal> + 1)}
    PushMemProfile \{ 'Goals script' }
    goal_bike_goals_add_goals zone = <zone>
    PopMemProfile
    if NOT GotParam \{ goal_id }
        printf \{ 'bike training goal not added successfully' }
        return 
    endif
    GoalManager_InitializeGoal name = <goal_id>
endscript

script goal_bike_goals_add_goals 
    printf 'goal_bike_goals_add_goals'
    if NOT InSplitScreenGame
        if GameModeEquals is_career
            CareerFunc func = GetCurrentBikeTrainingGoal
            if ((<current_bike_training_goal> = 0)|| (<current_bike_training_goal> = (goal_bike_goals_max_goals)))
                printf 'first or max, returning'
                return 
            endif
            <found_ped> = 0
            begin 
            begin 
            getrandomvalue name = ped_num a = 1 b = (goal_bike_goals_num_goal_peds)integer
            if NOT (<ped_num> = (goal_bike_goals_last_goal_ped))
                change goal_bike_goals_last_goal_ped = <ped_num>
                break 
            endif
            repeat 50
            if (<ped_num> < 10)
                FormatText checksumname = ped_name '%z_TRG_Ped_BikeGoal%f%n' z = <zone> f = 0 n = <ped_num>
                FormatText checksumname = restart_name '%z_TRG_Restart_BikeGoal%f%n' z = <zone> f = 0 n = <ped_num>
            else
                FormatText checksumname = ped_name '%z_TRG_Ped_BikeGoal%n' z = <zone> n = <ped_num>
                FormatText checksumname = restart_name '%z_TRG_Restart_BikeGoal%n' z = <zone> n = <ped_num>
            endif
            if IsInNodeArray <ped_name>
                <found_ped> = 1
                break 
            endif
            repeat (goal_bike_goals_num_goal_peds)
            if (<found_ped> = 0)
                printf 'ped not found, returning'
                return 
            endif
            (goal_bike_goals [ <current_bike_training_goal> ].goal_script){
                (goal_bike_goals [ <current_bike_training_goal> ].goal_params)
                ped_name = <ped_name>
                restart_name = <restart_name>
                zone = <zone>
            }
            return goal_id = <goal_id>
        endif
    endif
endscript

script goal_bike_goals_check_duplicate_goal 
    if GoalManager_GoalExists name = <goal_id>
        GoalManager_UninitializeGoal name = <goal_id>
        GoalManager_RemoveGoal name = <goal_id>
    endif
endscript

script goal_bike_goals_bike_start 
    MakeSkaterGoto \{ Bike_Start }
    if GotParam \{ start_timer }
        SpawnScriptLater goal_bike_goals_basics_timer params = { goal_id = <goal_id> }
    endif
endscript

script goal_bike_goals_start_basics_goal 
    printf 'goal_bike_goals_start_basics_goal'
    if NOT GetCurrentZoneName
        printf 'goal_bike_goals_start_basics_goal: no current zone?'
        return 
    endif
    change goal_bike_goals_last_goal_ped = 1
    FormatText checksumname = ped_name '%z_TRG_Ped_BikeGoal%f%n' z = <zone_name> f = 0 n = 1
    FormatText checksumname = restart_name '%z_TRG_Restart_BikeGoal%f%n' z = <zone_name> f = 0 n = 1
    if NOT IsInNodeArray <ped_name>
        printf 'bike training goal not added successfully'
        goal_bike_goals_bike_start
        return 
    endif
    if NOT IsInNodeArray <restart_name>
        printf 'bike training goal not added successfully'
        goal_bike_goals_bike_start
        return 
    endif
    (goal_bike_goals [ 0 ].goal_script){
        (goal_bike_goals [ 0 ].goal_params)
        ped_name = <ped_name>
        restart_name = <restart_name>
        zone = <zone_name>
    }
    if NOT GotParam goal_id
        printf 'bike training goal not added successfully'
        goal_bike_goals_bike_start
        return 
    endif
    GoalManager_InitializeGoal name = <goal_id>
    GoalManager_ActivateGoal name = <goal_id>
endscript

script goal_bike_goals_basics 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 888
    FormatText checksumname = goal_id '%z_goal_gaps%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Gaps {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        goal_flags = [ got_1 got_2 ]
        time = 30
        show_goal_timer
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        goal_gameplay_start_params = {start_timer = 1 goal_id = <goal_id>}
        goal_deactivate_script = goal_bike_goals_basics_deactivate
        goal_deactivate_params = { goal_id = <goal_id> }
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_basics_timer 
    SetException Ex = SkaterBailed scr = goal_bike_goals_basics_fail params = { goal_id = <goal_id> }group = goal_bike_goals_basics
    <time> = 0
    begin 
    if SkaterSpeedGreaterThan \{ 100.0 }
        GoalManager_SetGoalFlag name = <goal_id> got_1 1
    endif
    if (<time> = 30)
        GoalManager_SetGoalFlag name = <goal_id> got_2 1
        ClearExceptionGroup \{ goal_bike_goals_basics }
        break 
    endif
    <time> = (<time> + 1)
    wait \{ 1 seconds }
    repeat 
endscript

script goal_bike_goals_basics_fail 
    ClearExceptionGroup \{ goal_bike_goals_basics }
    begin 
    if NOT skater ::InBailState
        break 
    endif
    wait \{ 1 frame }
    repeat 
    GoalManager_LoseGoal name = <goal_id>
endscript

script goal_bike_goals_basics_deactivate 
    ClearExceptionGroup \{ goal_bike_goals_basics }
    KillSpawnedScript \{ name = goal_bike_goals_basics_timer }
endscript

script goal_bike_goals_tailwhip 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 888
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Tailwhipy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Tailwhip'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_crankflip 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 887
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Crankflipy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Crankflip'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_barspin 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 886
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Barspins'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Barspin'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_xup 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 885
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'X-Upy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'X-Up'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_tabletop 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 884
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Tabletopy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Tabletop'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_backwards 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 883
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 4
        use_hud_counter
        hud_counter_caption = '180'
        count_tricks
        goal_type_checksum = count_tricks
        spin = 180
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_spins 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 882
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = '360'
        count_tricks
        goal_type_checksum = count_tricks
        spin = 360
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_flips 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 881
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Flips'
        count_tricks
        goal_type_checksum = count_tricks
        flips = 1
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_flairs 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 880
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Flairy'
        count_tricks
        goal_type_checksum = count_tricks
        spin = 180
        flips = 1
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_double_crankflip 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 879
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Double Crankflipy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'double\_Crankflip'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_double_barspin 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 878
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Double Barspiny'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'double\_Barspin'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_double_tailwhip 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 878
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Double Tailwhipy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'double\_Tailwhip'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_manuals 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 887
    FormatText checksumname = goal_id '%z_goal_gaps%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Gaps {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        goal_flags = [ got_1 ]
        time = 120
        show_goal_timer
        hold_trick
        trick_type = Manual
        trick_time = 5
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_land_manual 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 886
    FormatText checksumname = goal_id '%z_goal_gaps%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Gaps {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        goal_flags = [ got_1 ]
        time = 120
        show_goal_timer
        mini_combo
        goal_type_checksum = mini_combo
        combo = [
            {text = [ 'tabletop' ]}
            {text = [ 'manual' ]}
        ]
        require_land
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_manual_decade 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 877
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Decade'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Decade'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_manual_crankflip 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 876
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Crankflipy podczas manuala'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'manual\_crankflip'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_manual_barspin 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 875
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Manual Barspins'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'manual\_barspin'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_manual_xup 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 874
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Manual X-Upy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'manual\_x-up'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_nose_manual_tailwhip 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 873
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Nosemanual Whips'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'nosemanual\_whip'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_nose_manual_crankflip 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 872
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Nosemanual Crankflipy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'nosemanual\_crankflip'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_nose_manual_endo 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 870
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Endo'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'endo'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_nose_manual_pivot 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 869
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Obroty'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'pivot'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_grind_double_peg 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 868
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Double Peg Grindy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Double\_Peg\_Grind'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_grind_icepick 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 867
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Icepick Grindy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Icepick\_Grind'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_grind_toothpick 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 866
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Toothpick Grindy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Toothpick\_Grind'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_grind_feeble 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 865
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Feeble Grindy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Feeble\_Grind'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_grind_smith 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 864
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Smith Grind'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Smith\_Grind'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_grind_stall 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 863
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 5
        use_hud_counter
        hud_counter_caption = 'Double Peg Stalle'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Double\_Peg\_Stall'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_tiretap 
    if ((IsXbox)|| (IsNGC)|| (isPC))
        <shot_text> = <alt_shot_text>
        <goal_text> = <alt_goal_text>
    endif
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 862
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Tire Tapy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'tire\_tap'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_nosepick 
    if ((IsXbox)|| (IsNGC)|| (isPC))
        <shot_text> = <alt_shot_text>
        <goal_text> = <alt_goal_text>
    endif
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 861
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Nose Pick'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'nose\_pick'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_spine_transfer 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 860
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Spine Transfer'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'spine\_transfer'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_acid_drop 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 859
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 3
        use_hud_counter
        hud_counter_caption = 'Bank dropy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'bank\_drop'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_wallplant 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 858
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 5
        use_hud_counter
        hud_counter_caption = 'Wallplanty'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'wall\_plant'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_tailtap 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 857
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Tail tapy'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'tail\_tap'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_wallride 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 856
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 120
        show_goal_timer
        number = 5
        use_hud_counter
        hud_counter_caption = 'Wallride\'y'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'wallride'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript

script goal_bike_goals_backwards_wallride 
    goal_bike_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        success_text = <success_text>
        fail_text = <fail_text>
        igc_name = <igc_name>
    }
    if NOT GotParam goal_description
        <goal_description> = <goal_text>
    endif
    <version> = 855
    FormatText checksumname = goal_id '%z_goal_counter%v' z = <zone> v = <version>
    goal_bike_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        version = <version>
        zone = <zone>
        goal_text = <goal_text>
        goal_description = <goal_description>
        trigger_obj_id = <ped_name>
        restart_node = <restart_name>
        safe_restart_node = <restart_name>
        time = 300
        show_goal_timer
        number = 2
        use_hud_counter
        hud_counter_caption = 'Wallride\'y ty³em'
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'backwards\_wallride'
        intro_scene = goal_bike_goals_intro_IGC
        success_scene = goal_bike_goals_success_IGC
        fail_scene = goal_bike_goals_fail_IGC
        goal_gameplay_start_script = goal_bike_goals_bike_start
        bike_training_goal
        cash_reward = 20
        ped_floater = bike_goals_ped_floater
        control_type = bike
    }
    return goal_id = <goal_id>
endscript
goal_bike_goals_intro_IGC = {}
goal_bike_goals_success_IGC = {}
goal_bike_goals_fail_IGC = {}

script goal_bike_goals_edit_IGCs 
    GetNode <ped_name>
    <ped_node> = <node>
    GetNode <restart_name>
    <restart_node> = <node>
    <cam_info> = {
        pos0 = ((<restart_node>.Pos)+ (0.0, 80.0, 0.0))
        pos1 = ((<ped_node>.Pos)+ (0.0, 80.0, 0.0))
        target0 = ((<ped_node>.Pos)+ (0.0, 50.0, 0.0))
        target1 = ((<restart_node>.Pos)+ (0.0, 50.0, 0.0))
    }
    <cam_actor_pos_index> = 0
    GetArraySize shot_text
    <shot_params> = []
    <index> = 0
    begin 
    FormatText checksumname = Pos 'pos%i' i = <cam_actor_pos_index>
    FormatText checksumname = target 'target%i' i = <cam_actor_pos_index>
    <tmp_array> = [
        {
            camera = {
                Pos = (<cam_info>.<Pos>)
                lookatpos = (<cam_info>.<target>)
                FOV = 50.0
                LockTo = world
                Quat = (0.0, 0.0, 0.0)
            }
            text = (<shot_text> [ <index> ])
            frames = 600
            skippable = 1
        }
    ]
    <shot_params> = (<shot_params> + <tmp_array>)
    <cam_actor_pos_index> = (1 - <cam_actor_pos_index>)
    <index> = (<index> + 1)
    repeat <array_size>
    change goal_bike_goals_intro_IGC = {
        name = <igc_name>
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped_name> use_fam = 1}
                { template = skater_actor }
            ]
            actor_positions = [
                {ActorNum = 1
                    node = <ped_name>
                }
                {ActorNum = 2
                    node = <restart_name>
                }
            ]
        }
        shot_params = <shot_params>
    }
    if NOT GotParam success_text
        <success_text> = 'wietna robota!  Masz tu dwie dychy.  Jak chcesz nauczyæ siê nowych trików i zarobiæ trochê kasy, wpadnij do mnie.'
    endif
    FormatText textname = igc_success_name '%s_success' s = <igc_name>
    change goal_bike_goals_success_IGC = {
        name = <igc_success_name>
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped_name> use_fam = 1}
                { template = skater_actor }
            ]
            actor_positions = [
                {ActorNum = 1
                    node = <ped_name>
                }
                {ActorNum = 2
                    node = <restart_name>
                }
            ]
        }
        shot_params = [
            {
                camera = {
                    Pos = (<cam_info>.pos0)
                    lookatpos = (<cam_info>.target0)
                    FOV = 50.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = <success_text>
                frames = 500
                skippable = 1
            }
        ]
    }
    if NOT GotParam fail_text
        <fail_text> = 'Hmm, nie ma opcji.  Przyjd do mnie, jak bêdziesz chcia³ jeszcze raz nauczyæ siê jakiego triku i zdobyæ trochê kasy.'
    endif
    FormatText textname = igc_fail_name '%s_fail' s = <igc_name>
    change goal_bike_goals_fail_IGC = {
        name = <igc_fail_name>
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped_name> use_fam = 1}
                { template = skater_actor }
            ]
            actor_positions = [
                {ActorNum = 1
                    node = <ped_name>
                }
                {ActorNum = 2
                    node = <restart_name>
                }
            ]
        }
        shot_params = [
            {
                camera = {
                    Pos = (<cam_info>.pos0)
                    lookatpos = (<cam_info>.target0)
                    FOV = 50.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = <fail_text>
                frames = 500
                skippable = 1
            }
        ]
    }
endscript
