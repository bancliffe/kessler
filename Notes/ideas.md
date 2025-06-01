# SETTING
Kessler Syndrome is a nightmare space scenario in which the number of satellites and orbital debris is so high that collisions occur, each one generating more and more space debris and, in turn, cascading collisions.

Hire contractors to break into orbital stations/ships to obtain data/research/samples before the ships shields lose power and fail against debris from kessler strikes. Mission time limit. 

Characters are scavengers and desperate people trying to earn enough money to live in stations outside the debris belt and off the dying earth.

*Sci-Fi Darkest Dungeon.*

## CHARACTERS

### Stats
- Accuracy (to-hit, crit chance)
- Agility (speed, dodge)
- Vitality (health, resistances)

Equipment modifies stats. 

- Protection (armor,natural)
  - type
- Weapons
  - type - chemical, energy, physical
  - penetration (how much protection to remove)
  - damage

### Passives

Like quirks in darkest dungeon, characters will start with a perk that gives them a +10%


# MECHANICS

Game will use a d100 system
> D100 <= (base stat) +/- (stat modifier) +/- (equipment modifier)

Randomized ship layout with connecting rooms. Rooms may have combat encounter or narrative encounter

Combat encounters will be player squad vs 4 enemies
positioning from front->back 
skills only hit certain positions on enemy line

## Classes

### Accuracy Classes
- Outer-rim Scav 
  - Neg - vitality
  - Role - Support
  - Theme - uses gadgets to buff/protect and Weak AoE
- Discharged Merc
  - Neg - agility
  - Role - DPS 
  - Theme - single target sniper

### Agility Classes
- Burned Hacker
  - Neg - accuracy
  - Role -  Controler
  - Theme - disable, move using powerglove
- Shunned Chemist
  - Neg - vitality
  - Role -  Healer
  - Theme - pump folks full of chems HoT/DoT

### Vitality Classes
- Belt Ganger
  - Neg - accuracy
  - Role -  DPS 
  - Theme - frontline Berserker, aoe, move
- Cargo-drone
  - Neg - agility
  - Role -  Tank
  - Theme - guard single target friends, stun enemies

  # Combat Pseudocode

**Start of combat**
  - Roll initiative
    - 1d20 + [agility] +- [condition modifiers]
  **start of round**
  - Activate highest speed character
    - execute any condition effects
    - if enemy - take action
    - if player
        - choose action/target
          - shift/move - swap places with an adjacent ally
          - Attack - default attack
          - Defend - increase dodge 
          - Special Skill per class
  - activate next highest speed

  variable for active character

  state_combat_activateCharacter
  state_combat_chooseAction
  state_combat_chooseTarget
  state_combat_executeAction