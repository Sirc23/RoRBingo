
# Risk of Rain 2 Bingo Card Generator
A small project developed for a friend and streamer, [Bumblebomb](https://www.twitch.tv/bumblebomb). Project developed on GameMaker: Studio v1.4.9999. Check [the releases section](https://github.com/Sirc23/RoRBingo/releases/) for downloads. Currently only supporting Windows executable files.

Board sizes range from 3x3 to 10x10. Any smaller and the card generation algorithm explodes. Any bigger and there aren't enough items in the game to complete a card.

### Card generation rules (v1.2)
```
1. If the board size is larger than 3x3, there must be exactly 1 equipment item in each column, row, and diagonal. Lunar equipment items count.
2. For each row, there is an 85% chance a lunar item will appear on that row. This chance is rolled twice when the board is 8x8 or higher, and the chance is reduced to 40% for boards smaller than 5x5. If a lunar equipment item is on that row, one less roll is applied.
3. There must be exactly 2 rare items on the board. This number increases by 1 for each increase in board size over 5x5.
4. There must be exactly 1 boss item on the board. This number increases by 1 for every 2 increases in board size over 5x5.
5. An item cannot have its corrupted version (aka void item) on the same ringo line (and vice versa)
```

### Omissions from the Item Pool
#### Rare Items:
 - Defensive Microbots
#### Boss / World Items:
- Artifact Key
- Irradiant Pearl
- Pearl
#### Equipment Items:
- Fuel Array
- Trophy Hunter's Tricorn (Consumed)
- Her Biting Embrace
- His Reassurance
- Ifrit's Distinction
- N'kuhana's Retort
- Shared Design
- Silence Between Two Strikes
- Spectral Circlet
### Controls

 - Left click on a tile to toggle it between captured and uncaptured.
 - Spacebar generates a new card with the specified board size and seed.
 - 'O' decreases the next board's size by 1 (to a minimum of 3x3).
 - 'P' increases the next board's size by 1 (to a maximum of 10x10).
 - 'C' copies the current seed to your clipboard as a sized seed (see below).
 - 'V' pastes your clipboard as the next seed.
 - 'R' prompts the user to manually enter new window dimensions (default is 480x500).

### Seeds
There are two categories of seeds: sized and unsized.
Here's an example of each:

Sized: `n=5;43501211`

Unsized: `30910045`

The only difference is that sized seeds force the board size while unsized seeds don't.

Seeds aren't limited to numbers either; they can be any string and the program will parse it into a number. Non-strings are not allowed (eg. images).