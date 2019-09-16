-- DROP DATABASE IF EXISTS heroesof;

-- CREATE DATABASE heroesof
--     WITH
--     ENCODING = 'UTF8';

-- \c heroesof;

DROP TABLE IF EXISTS "User", Part, Phase, Score, Troop, Barrack, Tower, Hero, Skill, Cutscene, Scene, Speak, AssetFilter;

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
    numPhase INTEGER NOT NULL,
    codPart INTEGER NOT NULL REFERENCES Part (codPart),
    namPhase VARCHAR NOT NULL,
    vlrIniPlayerMoney INTEGER NOT NULL,
    vlrIniIAMoney INTEGER NOT NULL,
    idtPhaseType PhaseType NOT NULL,
    PRIMARY KEY (numPhase)
);

CREATE TABLE "User" (
    idtGoogleAccount VARCHAR NOT NULL,
    numCurrentPhase INTEGER NOT NULL REFERENCES Phase (numPhase),
    namUser VARCHAR NOT NULL,
    PRIMARY KEY (idtGoogleAccount)
);

CREATE TABLE Score (
    idtGoogleAccount VARCHAR NOT NULL REFERENCES "User" (idtGoogleAccount),
    numPhase INTEGER NOT NULL REFERENCES Phase (numPhase),
    vlrRecordPoints INTEGER,
    PRIMARY KEY (idtGoogleAccount, numPhase)
);

CREATE TABLE Troop (
    codTroop INTEGER NOT NULL,
    namTroop VARCHAR NOT NULL,
    vlrDamageDealt INTEGER NOT NULL,
    vlrHp INTEGER NOT NULL,
    vlrScore INTEGER NOT NULL,
    vlrMotionSpeed FLOAT NOT NULL,
    vlrAttackSpeed FLOAT NOT NULL,
    vlrDropMoney INTEGER NOT NULL,
    PRIMARY KEY (codTroop)
);

CREATE TABLE Barrack (
    codBarrack INTEGER NOT NULL,
    codPart INTEGER NOT NULL REFERENCES Part (codPart),
    codTroop INTEGER NOT NULL REFERENCES Troop (codTroop),
    namBarrack VARCHAR NOT NULL,
    desBarrack VARCHAR NOT NULL,
    vlrSpawnFrequency INTEGER NOT NULL,
    vlrCost INTEGER NOT NULL,
    numTroopLimit INTEGER NOT NULL,
    PRIMARY KEY (codBarrack)
);

CREATE TABLE Tower (
    codTower INTEGER NOT NULL,
    vlrHp INTEGER NOT NULL,
    numEffectArea INTEGER NOT NULL,
    PRIMARY KEY (codTower)
);

CREATE TABLE Hero (
    codHero INTEGER NOT NULL,
    codPart INTEGER NOT NULL REFERENCES Part (codPart),
    namHero VARCHAR NOT NULL,
    desHero VARCHAR NOT NULL,
    vlrHp INTEGER NOT NULL,
    vlrScore INTEGER NOT NULL,
    vlrDamageDealt INTEGER NOT NULL,
    vlrMotionSpeed FLOAT NOT NULL,
    vlrAttackSpeed FLOAT NOT NULL,
    vlrDropMoney INTEGER NOT NULL,
    PRIMARY KEY (codHero)
);

CREATE TABLE Skill (
    codSkill INTEGER NOT NULL,
    codHero INTEGER NOT NULL REFERENCES Hero (codHero),
    namSkill VARCHAR NOT NULL,
    desSkill VARCHAR NOT NULL,
    vlrDamage INTEGER,
    numEffectArea INTEGER NOT NULL,
    numCooldown INTEGER NOT NULL,
    idtAttributeBuff BOOLEAN NOT NULL,
    PRIMARY KEY (codSkill)
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
    namTable VARCHAR NOT NULL UNIQUE,
    txtAssetFilter VARCHAR NOT NULL,
    txtAssetPath VARCHAR NOT NULL,
    PRIMARY KEY (namTable)
);