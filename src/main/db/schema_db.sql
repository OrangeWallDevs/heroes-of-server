-- DROP DATABASE IF EXISTS heroesof;

-- CREATE DATABASE heroesof
--     WITH
--     ENCODING = 'UTF8';

-- \c heroesof;

DROP TABLE IF EXISTS GameUser, Part, Phase, Score, Troop, Barrack, Tower, Hero, Skill, Cutscene, Scene, Speak, AssetFilter;

-- "CREATE TYPE" section

DO $$ BEGIN
    CREATE TYPE PhaseType AS ENUM ('Defense', 'Attack');
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

-- "CREATE TABLE" section

CREATE TABLE Part (
    codPart INTEGER NOT NULL,
    namPart VARCHAR NOT NULL,
    PRIMARY KEY (codPart)
);

CREATE TABLE Phase (
    codPart INTEGER NOT NULL REFERENCES Part (codPart),
    numPhase INTEGER NOT NULL,
    namPhase VARCHAR NOT NULL,
    valIniPlayerMoney INTEGER NOT NULL,
    valIniIAMoney INTEGER NOT NULL,
    idtPhaseType PhaseType NOT NULL,
    PRIMARY KEY (numPhase)
);

CREATE TABLE GameUser (
    idtGoogleAccount VARCHAR NOT NULL,
    numCurrentPhase INTEGER NOT NULL REFERENCES Phase (numPhase),
    namUser VARCHAR NOT NULL,
    PRIMARY KEY (idtGoogleAccount)
);

CREATE TABLE Score (
    idtGoogleAccount VARCHAR NOT NULL REFERENCES GameUser (idtGoogleAccount),
    numPhase INTEGER NOT NULL REFERENCES Phase (numPhase),
    valRecordPoints INTEGER,
    PRIMARY KEY (idtGoogleAccount, numPhase)
);

CREATE TABLE Troop (
    codTroop INTEGER NOT NULL,
    namTroop VARCHAR NOT NULL,
    assetIdentifier VARCHAR NOT NULL,
    valDamageDealt INTEGER NOT NULL,
    valHp INTEGER NOT NULL,
    valScore INTEGER NOT NULL,
    valMotionSpeed FLOAT NOT NULL,
    valAttackSpeed FLOAT NOT NULL,
    valDropMoney INTEGER NOT NULL,
    PRIMARY KEY (codTroop)
);

CREATE TABLE Barrack (
    codBarrack INTEGER NOT NULL,
    codPart INTEGER NOT NULL REFERENCES Part (codPart),
    codTroop INTEGER NOT NULL REFERENCES Troop (codTroop),
    namBarrack VARCHAR NOT NULL,
    desBarrack VARCHAR NOT NULL,
    assetIdentifier VARCHAR NOT NULL,
    valSpawnFrequency INTEGER NOT NULL,
    valCost INTEGER NOT NULL,
    numTroopLimit INTEGER NOT NULL,
    PRIMARY KEY (codBarrack)
);

CREATE TABLE Tower (
    codTower INTEGER NOT NULL,
    valHp INTEGER NOT NULL,
    numEffectArea INTEGER NOT NULL,
    PRIMARY KEY (codTower)
);

CREATE TABLE Hero (
    codHero INTEGER NOT NULL,
    codPart INTEGER NOT NULL REFERENCES Part (codPart),
    namHero VARCHAR NOT NULL,
    desHero VARCHAR NOT NULL,
    assetIdentifier VARCHAR NOT NULL,
    valHp INTEGER NOT NULL,
    valScore INTEGER NOT NULL,
    valDamageDealt INTEGER NOT NULL,
    valMotionSpeed FLOAT NOT NULL,
    valAttackSpeed FLOAT NOT NULL,
    valDropMoney INTEGER NOT NULL,
    PRIMARY KEY (codHero)
);

CREATE TABLE Skill (
    codHero INTEGER NOT NULL REFERENCES Hero (codHero),
    codSkill INTEGER NOT NULL,
    namSkill VARCHAR NOT NULL,
    desSkill VARCHAR NOT NULL,
    valDamage INTEGER,
    numEffectArea INTEGER NOT NULL,
    numCooldown INTEGER NOT NULL,
    idtAttributeBuff BOOLEAN NOT NULL,
    PRIMARY KEY (codSkill, codHero)
);

CREATE TABLE Cutscene (
    codCutscene INTEGER NOT NULL,
    codPart INTEGER NOT NULL REFERENCES Part (codPart),
    PRIMARY KEY (codCutscene)
);

CREATE TABLE Scene (
    codCutscene INTEGER NOT NULL REFERENCES Cutscene (codCutscene),
    codScene INTEGER NOT NULL,
    desScene VARCHAR NOT NULL,
    PRIMARY KEY (codCutscene, codScene)
);

CREATE TABLE Speak (
    codCutscene INTEGER NOT NULL,
    codScene INTEGER NOT NULL,
    codSpeak INTEGER NOT NULL,
    FOREIGN KEY (codCutscene, codScene) REFERENCES Scene (codCutscene, codScene),
    PRIMARY KEY (codCutscene, codScene, codSpeak)
);

CREATE TABLE AssetFilter (
    namTable VARCHAR NOT NULL,
    txtAssetFilter VARCHAR,
    txtAssetPath VARCHAR,
    PRIMARY KEY (namTable)
);