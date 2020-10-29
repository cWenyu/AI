% facts
mammal(subclass,animal).
mammal(moving_method,walk).
mammal(social_behavior,social_animal).

carnivorous(subclass,mammal).
carnivorous(food,meat).

whale(subclass,carnivorous).
whale(month_of_pregnant_period,12).
whale(moving_method,swim).

alice(instance,whale).

lion(subclass,carnivorous).
lion(month_of_pregnant_period,4).

simba(instance,lion).

omnivorous(subclass,mammal).
omnivorous(food,general).

panda(subclass,omnivorous).
panda(5,month_of_pregnant_period).
panda(social_behavior,solitary_animal).

tuantuan(instance,panda).

human(subclass,omnivorous).
human(month_of_pregnant_period,10).

aotianlong(instance,human).

herbivorous(subclass,mammal).
herbivorous(food,plant).

horse(subclass,herbivorous).
hourse(month_of_pregnant_period,11).

applejack(instance,horse).

sheep(subclass,herbivorous).
sheep(month_of_pregnant_period,5).

paddi(instance,sheep).

iscallable(mammal).                                                          
iscallable(herbivorous). 
iscallable(sheep).
iscallable(paddi).
iscallable(horse).
iscallable(applejack).
iscallable(omnivorous). 
iscallable(panda). 
iscallable(tuantuan).
iscallable(human). 
iscallable(aotianlong).
iscallable(carnivorous).  
iscallable(whale). 
iscallable(alice).
iscallable(lion).
iscallable(simba).

% Rules Bratko Code V2, reference:

value( Frame, Slot, Value) :-
    iscallable(Frame),
	Query =.. [ Frame, Slot, Value],
	call( Query),!.


value( Frame, Slot, Value) :-
	parent( Frame, ParentFrame),
	value( ParentFrame, Slot, Value).

parent( Frame, ParentFrame) :-
    iscallable(Frame),
	(Query =.. [Frame, instance, ParentFrame]
	;
	Query =.. [Frame, subclass, ParentFrame]),
	call(Query).
