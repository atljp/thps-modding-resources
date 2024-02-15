goal_bike_goals = [
    {
        goal_script = goal_bike_goals_basics
        goal_params = {
            shot_text = [ 'Du kannst BMX fahren? Ich geb dir Geld, wenn du meine Tricks lernst. Erst die Grundlagen.' 'Der größte Unterschied zwischen Skaten und BMX ist, dass du dich mit \bk und \bl vorwärts bewegst.' 'Mit \bk lenkst du das Bike. Versuch, 30 Sekunden lang zu fahren ohne hinzufallen.' 'Halte \b3 zum Treten, lass \b3 los zum Springen. Mit \bk lenkst du. Halte \bf zum Anhalten. Mit \bf und dem \bk links oder rechts skiddest du.' ]
            goal_text = 'Halte \b3 zum Treten. Lass \b3 los zum Springen. Mit \bk lenkst du. Halte \bf zum Anhalten. Halte \bf und drück \bk nach links oder rechts zum Skidden.'
            success_text = 'Gut. Du kannst jederzeit vom Rad absteigen, indem du \mm drückst. Aber natürlich nur, wenn du nicht gerade in einer Aufgabe bist.'
            igc_name = 'basics'
        }
    }
    {
        goal_script = goal_bike_goals_tailwhip
        goal_params = {
            shot_text = [ 'Hm, vielleicht bist du doch ganz gut. 20 Mäuse, dass du keinen Tailwhip schaffst.' 'Spring mit \b3 und drück dann \bl rechts oder links für einen Tailwhip.' 'Mal sehen, ob du 3 Tailwhips hinlegen kannst.' ]
            goal_text = 'Spring mit \b3 und drück dann \bl rechts oder links für einen Tailwhip.'
            igc_name = 'tailwhip'
        }
    }
    {
        goal_script = goal_bike_goals_crankflip
        goal_params = {
            shot_text = [ 'Du lernst schnell, dann mal weiter: 20 Dollar, wenn du einen Crankflip schaffst.' 'Spring mit \b3 an und beweg dann \bl nach oben für einen Crankflip.' 'Ich möchte jetzt 3 Crankflips von dir sehen, Mr. Freestyle.' ]
            goal_text = 'Spring mit \b3 und beweg dann \bl nach oben für einen Crankflip.'
            igc_name = 'crankflip'
        }
    }
    {
        goal_script = goal_bike_goals_barspin
        goal_params = {
            shot_text = [ 'Du bist der Hit! Hier ist was für dich. 20 Kröten, wenn du den Barspin schaffst.' 'Spring mit \b3 und bewege dann \bl nach unten für einen Barspin.' 'Leg jetzt 3 Barspins hin, Skate-Meister.' ]
            goal_text = 'Spring mit \b3 und beweg \bl leicht nach unten für einen Barspin.'
            igc_name = 'barspin'
        }
    }
    {
        goal_script = goal_bike_goals_xup
        goal_params = {
            shot_text = [ 'Gut, mal sehen, was du noch so kannst. 20 Kröten für dich, wenn du mir ein paar X-Ups zeigst.' 'Das hier ist anders, du kannst ein paar Air-Tricks machen. Einer davon ist der X-Up.' 'Spring mit \b3 und mach dann mit \b2 einen X-Up. Zeig mir 3 davon und ich bin beeindruckt.' ]
            goal_text = 'Spring mit \b3 und mach dann mit \b2 einen X-Up.'
            igc_name = 'xup'
        }
    }
    {
        goal_script = goal_bike_goals_tabletop
        goal_params = {
            shot_text = [ 'Wow, du bist gut! Ich hab noch mehr Geld für dich, wenn du mir den Tabletop machst.' 'Das hier ist anders, du kannst ein paar Air-Tricks machen. Einer davon ist der Tabletop.' 'Spring mit \b3 und mach dann mit \b1 einen Tabletop. Sieh zu, ob du 3 schaffst.' ]
            goal_text = 'Spring mit \b3 und mach dann mit \b1 einen Tabletop.'
            igc_name = 'tabletop'
        }
    }
    {
        goal_script = goal_bike_goals_backwards
        goal_params = {
            shot_text = [ 'Hier ist etwas Neues für dich: Ich lass dir 20 Mäuse da, wenn du rückwärts fahren kannst.' 'Halte die Anzeige in der Mitte, um gerade zu fahren. Du kannst dich auf verschiedene Arten vorwärts bewegen.' 'Spring mit \b3 und halte dann links oder rechts auf dem \bk für einen 180.' 'Du kannst auch \mr für einen Pivot auf deinem Hinterrad halten, um wieder vorwärts zu fahren.' ]
            goal_text = 'Spring und dreh dich um 180 Grad, um rückwärts zu fahren. Mach das noch einmal oder halte \mr für einen Pivot, um wieder forwärts zu fahren.'
            igc_name = 'backwards'
        }
    }
    {
        goal_script = goal_bike_goals_spins
        goal_params = {
            shot_text = [ 'Machen wir ein paar Air-Tricks. Ich geb so richtig einen aus, wenn du diese Air-Moves hinbekommst.' 'Versuchen wir zuerst einen 360. Du musst dich schnell drehen, um dich um mehr als 180 Grad zu drehen.' 'Spring von einer Quarterpipe ab, indem du auf dem Weg nach oben \b3 drückst, halte dann \mo und links oder rechts auf dem \bk.' 'Mach 3 360s und ich belohn dich mit 20 Mäusen. Denk dran, es gilt erst, wenn du wieder vorwärts fährst.' ]
            goal_text = 'Dreh dich schnell mit \mo, während du links und rechts auf dem \bk hältst für einen 360.'
            igc_name = 'spins'
        }
    }
    {
        goal_script = goal_bike_goals_flips
        goal_params = {
            shot_text = [ 'Gut. Leg jetzt noch krankere Air-Tricks hin und du wirst reich.' 'Flips sind wie 360 Spins. Du musst sie schnell ausführen, damit du ganz rumkommst.' 'Spring mit \b3 aus einer Quarterpipe, halte dann \mo und \bk oben oder unten.' 'Mach 3 Flips und die 20 Ocken gehören dir. Denk dran, es zählt erst, wenn du wieder vorwärts fährst.' ]
            goal_text = 'Mach schnelle Flips mit \mo, während du \bk nach oben oder unten drückst.'
            igc_name = 'flips'
        }
    }
    {
        goal_script = goal_bike_goals_flairs
        goal_params = {
            shot_text = [ 'Jetzt wird\'s schwierig! Beweise deine Luftkünste, ich möchte ein paar Flairs sehen.' 'Ein Flair ist ein Backflip mit einem 180, damit du normal landest. Mach alles gleichzeitig oder erst den Backflip und dann den 180 vor der Landung.' 'Spring hoch von einer Quarterpipe ab, drück \bk im Winkel nach unten, während du \mo hältst, um dich schnell zu drehen.' 'Wenn du sogar 2 davon schaffst, bekommst du 20 Dollar.' ]
            goal_text = 'Mach schnell einen Backflip, während du \mo hältst, und drück \bk im Winkel nach unten für einen Flair.'
            igc_name = 'flairs'
        }
    }
    {
        goal_script = goal_bike_goals_double_crankflip
        goal_params = {
            shot_text = [ 'Jetzt hast du eine ganz nette Trickkiste zusammen, aber ich wette um 20 Kröten, dass du deine Air-Tricks nicht vedoppeln kannst.' 'Manche Air-Tricks kannst du halten, z. B. den Crankflip, um sie doppelt oder dreifach auszuführen.' 'Spring hoch von einer Quarterpipe ab und halte dann \bl nach oben gedrückt für einen Double oder sogar einen Triple Crankflip.' 'Ich möchte 3 Double Crankflips sehen, bevor du Geld bekommst.' ]
            goal_text = 'Spring hoch ab und halte \bl oben für einen Double Crankflip.'
            igc_name = 'double_crankflip'
        }
    }
    {
        goal_script = goal_bike_goals_double_barspin
        goal_params = {
            shot_text = [ 'Du lernst schnell. Mal sehen, welche Tricks du noch doppeln und zu Geld machen kannst.' 'Manche Air-Tricks kannst du halten, z. B. den Barspin, um sie doppelt oder dreifach auszuführen.' 'Spring hoch von einer Quarterpipe ab und halte dann \bl nach unten gedrückt für einen Double oder sogar einen Triple Barspin.' '3 Double Barspins bringen dir 20 weiter Dollar ein.' ]
            goal_text = 'Spring hoch ab und halte dann \bl nach unten gedrückt für einen Double Barspin.'
            igc_name = 'double_barspin'
        }
    }
    {
        goal_script = goal_bike_goals_double_tailwhip
        goal_params = {
            shot_text = [ 'Du hast ein gutes Repertoire an doppelten Tricks, aber ich wette mit dir um 20 Mäuse, dass du keine Double Tailwhips schaffst.' 'Manche Air-Tricks kannst du halten, z. B. den Tailwhip, um sie doppelt oder dreifach auszuführen.' 'Spring hoch von einer Quarterpipe ab und halte \bl rechts oder links gedrückt für einen Double oder sogar Triple Tailwhip.' 'Wenn du 3 Double Tailwhips schaffst, erhältst du ein Preisgeld.' ]
            goal_text = 'Spring hoch ab und halte dann \bl rechts oder links gedrückt für einen Double Tailwhip.'
            igc_name = 'double_tailwhip'
        }
    }
    {
        goal_script = goal_bike_goals_manuals
        goal_params = {
            shot_text = [ 'Es fällt mir schwer, das zuzugeben, aber du bist gar nicht übel. Ich lass was springen, wenn du mir Flatlands machst.' 'Manuals sind der Schlüssel. Drück \bk nach nach unten für einen Manual und halte dann mit oben und unten die Balance.' 'Nose Manuals funktionieren genauso, aber dazu musst du vorwärts fahren. Halte 5 Sekunden lang einen beliebigen Manual.' ]
            goal_text = 'Drück \bk nach oben oder unten, um in einen Manual zu gehen. Halte ihn 5 Sekunden lang.'
            igc_name = 'manuals'
        }
    }
    {
        goal_script = goal_bike_goals_land_manual
        goal_params = {
            shot_text = [ 'Ich habe 20 Dollar, die sagen, dass du jedoch keine Kombo damit machen darfst.' 'Wie beim Skaten kannst du deine Kombo fortsetzen, wenn du in einem Manual landest, indem du \bk nach oben oder unten drückst.' 'Spring mit \b3 und mach dann mit \b1 einen Tabletop. Drück dann \bk nach unten, um im Manual zu landen.' ]
            goal_text = 'Spring mit \b3 und mach dann mit \b1 einen Tabletop. Drück dann \bk nach unten, um im Manual zu landen.'
            igc_name = 'land_manual'
        }
    }
    {
        goal_script = goal_bike_goals_manual_decade
        goal_params = {
            shot_text = [ 'Machen wir ein paar Manual-Tricks. Wenn du einen Decade schaffst, bekommst du 20 Kröten.' 'Drück \bk nach unten für einen Manual und beweg dann \bl nach links oder rechts für einen Decade.' 'Mach 3 Decades und das Geld gehört dir.' ]
            goal_text = 'Drück \bk nach unten für einen Manual und beweg dann \bl nach links oder rechts.'
            igc_name = 'manual_decade'
        }
    }
    {
        goal_script = goal_bike_goals_manual_crankflip
        goal_params = {
            shot_text = [ 'Okay, noch mehr Manual-Tricks. Noch mal 20 Dollar für 3 Manual Crankflips.' 'Drück \bk nach unten für einen Manual und beweg dann \bl nach oben.' 'Mach 3 Manual Crankflips und es regnet Geld.' ]
            goal_text = 'Drück \bk nach unten für einen Manual und beweg dann \bl nach oben.'
            igc_name = 'manual_crankflip'
        }
    }
    {
        goal_script = goal_bike_goals_manual_barspin
        goal_params = {
            shot_text = [ 'Wow, was jetzt? Wie wär\'s mit Manual Barspins. 3 Manual Barspins und du bekommst 20 Mäuse.' 'Drück \bk nach unten für einen Manual und beweg dann \bl nach unten.' 'Das Geld gehört dir, wenn ich 3 Manual Barspins gesehen habe.' ]
            goal_text = 'Drück \bk nach unten für einen Manual und beweg dann \bl nach unten.'
            igc_name = 'manual_barspin'
        }
    }
    {
        goal_script = goal_bike_goals_manual_xup
        goal_params = {
            shot_text = [ 'Gut, hier ist noch ein Manual-Trick. Wenn du mir Manual X-Ups zeigst, lass ich was springen.' 'Drück \bk nach unten für einen Manual und mach dann mit \b2 einen Manual X-Up.' 'Mach 3 Manual X-Ups und du bist 20 Dollar reicher.' ]
            goal_text = 'Beweg \bk nach unten für einen Manual und drück dann \b2. '
            igc_name = 'manual_xup'
        }
    }
    {
        goal_script = goal_bike_goals_nose_manual_tailwhip
        goal_params = {
            shot_text = [ 'Wie wär\'s mit Nose Manuals? Mach ein paar Tailwhips in einem Nose Manual, dann zahl ich dir was.' 'Drück \bk nach oben für einen Nose Manual und bewege dann \bl nach links oder rechts für einen Flatland Whip.' 'Verdien dir 20 Mäuse mit 3 Flatland Whips.' ]
            goal_text = 'Drück \bk nach oben für einen Nose Manual und beweg dann \bl nach links oder rechts.'
            igc_name = 'nose_manual_tailwhip'
        }
    }
    {
        goal_script = goal_bike_goals_nose_manual_crankflip
        goal_params = {
            shot_text = [ 'Wie wär\'s mit noch ein paar Nose Manuals? Mehr Geld wartet auf dich, wenn du mir ein paar Nose Manual Crankflips gibst.' 'Drück \bk nach oben für einen Nose Manual und beweg dann \bl nach oben für einen Crankflip.' 'Zeig mir 3 Nose Manual Crankflips und du bist 20 Mäuse reicher.' ]
            goal_text = 'Drück \bk nach oben für einen Nose Manual und beweg dann \bl nach oben für einen Crankflip.'
            igc_name = 'nose_manual_crankflip'
        }
    }
    {
        goal_script = goal_bike_goals_nose_manual_endo
        goal_params = {
            shot_text = [ 'Hier ist was für dich. Du kannst auch mit einem Endo in einen Nose Manual gehen. Schaffst du das?' 'Halte beim Fahren \be (deine Vorderbremse), um abzubremsen und einen Endo zu machen. Mit \bk hältst du die Balance.' 'Zeig mir 3 Endos und noch mehr Kohle fließt in deine Taschen.' ]
            goal_text = 'Halte \be (Vorderbremsen) für einen Endo, mit \bk hältst du die Balance.'
            igc_name = 'nose_manual_endo'
        }
    }
    {
        goal_script = goal_bike_goals_nose_manual_pivot
        goal_params = {
            shot_text = [ 'Ein letzter Nose Manual-Trick. Ich geb dir 20 Kröten, wenn du mir Nose Manual Pivots machst.' 'Drück \bk nach oben für einen Nose Manual und tipp dann \mr an, um mit einem Pivot in einen Nose Manual rückwärts überzugehen.' 'Mach 3 Nose Manual Pivots und du bist um 20 Dollar reicher.' ]
            goal_text = 'Drück \bk nach oben für einen Nose Manual und tipp dann \mr an, um mit einem Pivot in einen Nose Manual rückwärts überzugehen.'
            igc_name = 'nose_manual_pivot'
        }
    }
    {
        goal_script = goal_bike_goals_grind_double_peg
        goal_params = {
            shot_text = [ 'Lass jetzt mal deine Grind-Skills sehen. Ich geb dir 20 Mäuse, wenn du einen Double Peg Grind schaffst.' 'Drück \b3 neben einem Rail zum Springen und dann \b0 zum Grinden. Wenn du \bk nicht nach oben oder unten drückst, machst du einen Double Peg.' '2 Double Peg Grinds für 20 Kröten. 10 Kröten pro Grind.' ]
            goal_text = 'Drück \b3 neben einem Rail, um zu springen, und mach dann mit \b0 einen Double Peg Grind.'
            igc_name = 'grind_double_peg'
        }
    }
    {
        goal_script = goal_bike_goals_grind_icepick
        goal_params = {
            shot_text = [ 'Grinden für Anspruchsvolle. Wenn du nur am Hinterrohr grindest, machst du einen Icepick Grind. Versuch\'s!' 'Spring mit \b3 neben einem Rail, drück \bk nach unten und mach dann mit \b0 einen Icepick Grind.' 'Mach 2 Icepick Grinds und verdien dir ein paar Mäuse.' ]
            goal_text = 'Spring mit \b3 neben einem Rail, drück dann \bk ganz nach unten und mach mit \b0 einen Icepick Grind.'
            igc_name = 'grind_icepick'
        }
    }
    {
        goal_script = goal_bike_goals_grind_toothpick
        goal_params = {
            shot_text = [ 'Bleiben wir bei den Grinds. Wenn du nur auf deinem Vorderrohr grindest, machst du einen Toothpick Grind. Lass mal sehen.' 'Spring mit \b3 neben einem Rail, drück dann \bk ganz nach oben und mach mit \b0 einen Toothpick Grind.' 'Mach 2 Toothpick Grinds und werde reicher.' ]
            goal_text = 'Spring mit \b3 neben einem Rail, drück dann \bk nach oben und mach mit \b0 einen Toothpick Grind.'
            igc_name = 'grind_toothpick'
        }
    }
    {
        goal_script = goal_bike_goals_grind_feeble
        goal_params = {
            shot_text = [ 'Okay, mehr Grinds für dich. Wenn du am Hinterrohr grindest und auf deinem Vorderrad fährst, machst du einen Feeble Grind.' 'Spring mit \b3 neben einem Rail, drück dann \bk halb nach unten und mach mit \b0 einen Feeble Grind.' 'Ich hab 20 Mäuse für dich, wenn du 2 Feeble Grinds für mich hast.' ]
            goal_text = 'Spring mit \b3 neben einem Rail, drück dann \bk halb nach unten und mach mit \b0 einen Feeble Grind.'
            igc_name = 'grind_feeble'
        }
    }
    {
        goal_script = goal_bike_goals_grind_smith
        goal_params = {
            shot_text = [ 'Okay, noch einen Grind musst du kennen. Grinde auf dem Vorderrohr und fahre auf deinem Hinterrad, dass ist ein Smith Grind.' 'Spring mit \b3 neben einem Rail, drück dann \bk halb nach oben und mach mit \b0 einen Smith Grind.' 'Mach 2 Smith Grinds und die 20 Mäuse gehören dir.' ]
            goal_text = 'Spring mit \b3 neben einem Rail, drück dann \bk halb nach oben und mach mit \b0 einen Smith Grind.'
            igc_name = 'grind_smith'
        }
    }
    {
        goal_script = goal_bike_goals_grind_stall
        goal_params = {
            shot_text = [ 'Hey, vergiss nicht die Stalls. Wie beim Skaten kannst du aus jedem Grind einen Stall machen, indem du \bh hältst.' 'Spring mit \b3 neben einem Rail. Halte dann \m4 und drück \b0 um deinen Grind zu halten.' 'Ich mach\'s dir leicht: 5 Double Peg Stalls und du bekommst 20 Mäuse.' ]
            goal_text = 'Spring mit \b3 neben einem Rail, halte dann \m4 und dann \b0, um deinen Grind zu halten.'
            igc_name = 'grind_stall'
        }
    }
    {
        goal_script = goal_bike_goals_tiretap
        goal_params = {
            shot_text = [ 'Weiter mit Tire Taps. Du kannst jedem Untergrund mit dem Hinterrad balancieren, indem du in der Luft \bf drückst.' 'Drück \b3, wenn du die Quarterpipe nach oben fährst, und dann \bf neben einer Kante in der Luft, um die QP auf dem Hinterrad landend zu verlassen.' 'Halte deine Balance mit \bk und spring dann mit \b3 zurück. Wende dich mit \bk wieder der Rampe zu.' 'Mach mir 2 davon und du bekommst noch mehr von meinem Geld.' ]
            goal_text = 'Spring von einer Quarterpipe ab und lande dann mit \bf auf deinem Hinterrad.'
            alt_shot_text = [ 'Weiter geht\'s mit den Tire Taps! Du kannst auf deiner Hinterachse balancieren, indem du in der Luft \b4 + \bf drückst.' 'Drück \b3, während du eine QP nach oben fährst. Beweg dann \bk nach unten und drück in der Luft \bf an einer Kante, um auf deiner Hinterachse zu landen. ' 'Halte deine Balance mit \bk und spring dann mit \b3 zurück. Wende dich mit \bk wieder der Rampe zu.' 'Mach mir 2 davon und du bekommst noch mehr von meinem Geld.' ]
            alt_goal_text = 'Spring von einer QP ab, beweg \bk nach unten und lande mit \bf auf der Hinterachse.'
            igc_name = 'tiretap'
        }
    }
    {
        goal_script = goal_bike_goals_nosepick
        goal_params = {
            shot_text = [ 'Okay, jetzt der Nose Pick. Du kannst auf einem beliebigen Untergrund auf deinem Vorderrad landen, indem du in der Luft \be drückst.' 'Drück \b3 in einer Quarterpipe auf dem Weg nach oben, drück \be in der Luft neben einer Kante und lande auf deinem Vorderrad.' 'Halte die Balance mit \bk, drück dann \b3, um zurückzuspringen. Mit \bk wendest du dich wieder der Rampe zu.' 'Ich geb dir 20 Dollar, wenn du 2 davon schaffst.' ]
            goal_text = 'Spring von einer Quarterpipe ab und lande dann mit \be mit deinem Vorderrad oben auf der QP.'
            alt_shot_text = [ 'Ok, nun lern den Nose Pick. Du kannst auf der Vorderachse balancieren, indem du in der Luft \b7 + \bf  drückst.' 'Drück \b3, während du eine Quarterpipe nach oben fährst. Beweg dann \bk nach oben und drück in der Luft \bf an einer Kante, um auf der Vorderachse zu landen.' 'Halte die Balance mit \bk, drück dann \b3, um zurückzuspringen. Mit \bk wendest du dich wieder der Rampe zu.' 'Ich geb dir 20 Dollar, wenn du 2 davon schaffst.' ]
            alt_goal_text = 'Spring von einer Quarterpipe ab und beweg dann \bk nach oben und lande mit \bf auf der Vorderachse.'
            igc_name = 'nosepick'
        }
    }
    {
        goal_script = goal_bike_goals_acid_drop
        goal_params = {
            shot_text = [ 'Hier was Leichtes. Du kannst sowohl Bank Drops auf die Dämme machen, als auch über sie skaten indem du \ml drückst.' 'Du kennst die Regel: 20 Kröten für 3 davon.' ]
            goal_text = 'Spring runter auf einen Damm und mach mit \ml einen Bank Drop.'
            igc_name = 'acid_drop'
        }
    }
    {
        goal_script = goal_bike_goals_spine_transfer
        goal_params = {
            shot_text = [ 'Du machst Spine Transfers mit \ml, nachdem du aus einer von zwei Rücken an Rücken stehenden Quarterpipes gesprungen bist.' 'Finde ein paar Rücken an Rücken stehende QPs und drück \ml, wenn du von einer abspringst, so machst du einen Spine Transfer in die andere.' 'Ich finde, 20 Dollar für 3 Spine Transfers sind fair.' ]
            goal_text = 'Spring von einer von zwei Rücken an Rücken stehenden Quarterpipes ab und mach mit \ml einen Spine Transfer.'
            igc_name = 'spine_transfer'
        }
    }
    {
        goal_script = goal_bike_goals_wallplant
        goal_params = {
            shot_text = [ 'Hier ist was für dich: Wall Plants. Drück wie beim Skaten \b3, wenn du auf eine Wand zuspringst.' 'Das ist so leicht, dafür will ich 5 sehen, wenn du mein Geld willst.' ]
            goal_text = 'Fahr gerade auf eine Wand zu und spring mit \b3. Drück dann \b3, bevor du die Wand berührst.'
            igc_name = 'wallplant'
        }
    }
    {
        goal_script = goal_bike_goals_tailtap
        goal_params = {
            shot_text = [ 'Wallplants kennst du ja, aber kannst du sie auch rückwärts? Fahr rückwärts auf eine Wand zu für einen Tail Tap.' 'Fahr gerade auf eine Wand zu. Springe und dreh dich um 180 Grad, zum rückwärts fahren. Dann spring und mach mit \b3 einen Tail Tap, noch vor der Wand.' 'Hier was Schweres: Mach 2 davon, dann lass ich was springen.' ]
            goal_text = 'Fahre rückwärts auf eine Wand zu und spring mit \b3. Drück dann \b3, bevor du die Wand berührst.'
            igc_name = 'tailtap'
        }
    }
    {
        goal_script = goal_bike_goals_wallride
        goal_params = {
            shot_text = [ 'Da ist noch was Leichtes: Wie beim Skaten kannst du einen Wallride machen, indem du im Winkel springst und dann \b0 hältst.' 'Du musst 5 von diesen leichten machen, wenn du die 20 Mäuse willst.' ]
            goal_text = 'Fahr im Winkel auf eine Wand zu und spring mit \b3. Drück dann \b0, bevor du die Wand berührst.'
            igc_name = 'wallride'
        }
    }
    {
        goal_script = goal_bike_goals_backwards_wallride
        goal_params = {
            shot_text = [ 'Wallrides beherrschst du, aber schaffst du das auch rückwärts? Mach einen 180-Sprung, bevor du deinen Wallride rückwärts machst.' 'Fahr im 180-Grad-Winkel auf eine Wand zu, spring und mach dann mit \b0 einen Wallride, bevor du die Wand berührst.' 'Hier was Schweres: Mach 2 davon, dann lass ich was springen.' ]
            goal_text = 'Mach einen 180 an einer Wand und dann mit \b0 einen Wallride rückwärts, bevor du die Wand berührst.'
            success_text = 'Nette Moves. Hier sind 20 Kröten. Ich hab dir beigebracht, was ich konnte, jetzt mach was draus!'
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
        hud_counter_caption = 'Tailwhips'
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
        hud_counter_caption = 'Crankflips'
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
        hud_counter_caption = 'X-Ups'
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
        hud_counter_caption = 'Tabletops'
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
        hud_counter_caption = 'Flairs'
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
        hud_counter_caption = 'Double Crankflips'
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
        hud_counter_caption = 'Double Barspins'
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
        hud_counter_caption = 'Double Tailwhips'
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
        hud_counter_caption = 'Decades'
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
        hud_counter_caption = 'Manual Crankflips'
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
        hud_counter_caption = 'Manual X-Ups'
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
        hud_counter_caption = 'Nosemanual Crankflips'
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
        hud_counter_caption = 'Endos'
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
        hud_counter_caption = 'Pivots'
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
        hud_counter_caption = 'Double Peg Grinds'
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
        hud_counter_caption = 'Icepick Grinds'
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
        hud_counter_caption = 'Toothpick Grinds'
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
        hud_counter_caption = 'Feeble Grinds'
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
        hud_counter_caption = 'Smith Grinds'
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
        hud_counter_caption = 'Double Peg Stalls'
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
        hud_counter_caption = 'Tire Taps'
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
        hud_counter_caption = 'Nose Picks'
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
        hud_counter_caption = 'Spine Transfers'
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
        hud_counter_caption = 'Bank Drops'
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
        hud_counter_caption = 'Wall Plants'
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
        hud_counter_caption = 'Tail Taps'
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
        hud_counter_caption = 'Wallrides'
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
        hud_counter_caption = 'Backwards Wallrides'
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
        <success_text> = 'Genial! Hier sind 20 Dollar. Komm mich besuchen, um mehr Tricks zu lernen und mehr Geld zu verdienen.'
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
        <fail_text> = 'Das war nichts. Komm zu mir, wenn du es noch mal versuchen und gegen Geld neue Bike-Tricks lernen willst.'
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
