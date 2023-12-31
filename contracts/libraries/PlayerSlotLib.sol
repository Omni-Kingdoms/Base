// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library PlayerSlotLib {
    struct Player {
        uint256 level;
        uint256 xp;
        uint256 status;
        uint256 strength;
        uint256 health;
        uint256 currentHealth;
        uint256 magic;
        uint256 mana;
        uint256 maxMana;
        uint256 agility;
        uint256 luck;
        uint256 wisdom;
        uint256 haki;
        uint256 perception;
        uint256 defense;
        string name;
        string uri;
        bool male;
        Slot slot;
        uint256 playerClass;
    }

    // slots {
    //     0: head;
    //     1: body;
    //     2: lefthand;
    //     3: rightHand;
    //     4: pants;
    //     5: feet;
    //     6: neck;
    // }

    // StatusCodes {
    //     0: idle;
    //     1: healthTrain;
    //     2: goldQuest;
    //     3: manaTrain;
    //     4: Arena;
    //     5: gemQuest;
    //     99: exchangeListing;
    // }

    // stat/equipment {
    //     0: strength;
    //     1: health;
    //     2: agility;
    //     3: magic;
    //     4: defense;
    //     5: maxMana;
    //     6: luck;
    // }

    // stat/Levelup {
    //     0: strength;
    //     1: health;
    //     2: agility;
    //     3: magic;
    //     4: defense;
    //     5: luck;
    //     6: mana;
    // }

    struct Slot {
        uint256 head;
        uint256 body;
        uint256 leftHand;
        uint256 rightHand;
        uint256 pants;
        uint256 feet;
        uint256 neck;
    }

    enum TokenTypes {
        PlayerMale,
        PlayerFemale,
        Guitar,
        Sword,
        Armor,
        Helmet,
        WizHat,
        SorcShoes,
        GemSword,
        GoldCoin,
        GemCoin,
        TotemCoin,
        DiamondCoin
    }

    enum PlayerClass {
        Warrior,
        Assasin,
        Mage
    }

    enum status {
        idle,
        healthTrain,
        goldQuest,
        manaTrain,
        Arena,
        gemQuest,
        exchangeListing
    }
}
