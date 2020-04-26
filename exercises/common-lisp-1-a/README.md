## Pokémon Battle

As an aspiring [Pokémon][pokemon] trainer, you're looking to get some battle
experience so you can hone your skills. The only problem is, you don't have any
Pokémon! Being the resourceful trainer you are, you decide to write a simple
computer program that will allow you to simulate Pokémon battles so you can be
prepared for the real deal.

### Making Pokémon

In this simplified simulator, every Pokémon has a name, type, attack stat, and
some HP (hit-points). You should define a function `make-pokemon` for
constructing a Pokémon from this information:

```lisp
(make-pokemon :name "Bulbasaur" :type 'grass :atk 5 :hp 45)
; => <something-representing-a-pokemon>
```

Where `:type` can be one of `'grass`, `'fire`, or `'water` and `:atk` and `:hp`
are numbers representing the attack stat and hit-points of the Pokémon
respectively.

### Battling Pokémon

You should then define a `battle` function that takes two Pokémon and returns
the name of the victor:

```lisp
(make-pokemon :name "Bulbasaur" :type 'grass :atk 5 :hp 45) ; => <grass-pokemon>
(make-pokemon :name "Charizard" :type 'fire  :atk 2 :hp 40) ; => <fire-pokemon>
(battle <grass-pokemon> <fire-pokemon>) ; => "Charizard"
```

When two Pokémon are passed into the battle simulator, they take turns attacking
until one of the Pokémon's HP drops to or below zero. In this version of the
simulator, the first Pokémon passed to the `battle` function goes first (in the
above example, the `<grass-pokemon>` hits first).

During an attack, the `hp` of the defender is reduced by the `atk` of the
attacker multiplied by a "type modifier". Therefore, the `hp` of the defender
after the attack becomes:

```
<defender-hp-after> = <defender-hp-before> - (<attacker-atk> * <type-modifier>)
```

Finally, the type modifier depends on the types of both Pokémon involved. It is
0.5x if the attacker is weak to the opponents type, 2x if the attacker is strong
to the opponents type, and 1x otherwise. For reference:

  - `fire`  beats `grass`
  - `grass` beats `water`
  - `water` beats `fire`

So when Bulbasaur is attacking Charizard, they get a 0.5x multiplier, but
Charizard gets a 2x multiplier when retaliating.

[pokemon]: https://en.wikipedia.org/wiki/Pok%C3%A9mon
