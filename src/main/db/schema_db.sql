
DROP TABLE IF EXISTS Score, GameUser, Phase, Barrack, Skill, Hero, Speak, Scene, Cutscene, Part, Troop, Tower, AssetFilter;

-- "CREATE TYPE" section

DO $$ BEGIN
    CREATE TYPE PhaseType AS ENUM ('Defense', 'Attack');
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

-- "CREATE TABLE" section

CREATE TABLE AssetFilter (
    namTable VARCHAR NOT NULL,
    txtAssetFilter VARCHAR,
    txtAssetPath VARCHAR,
    PRIMARY KEY (namTable)
);

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
    txtAssetIdentifier VARCHAR NOT NULL,
    valDamageDealt INTEGER NOT NULL,
    valHp INTEGER NOT NULL,
    valScore INTEGER NOT NULL,
    valMotionSpeed FLOAT NOT NULL,
    valAttackSpeed FLOAT NOT NULL,
    valDropMoney INTEGER NOT NULL,
    valAttackDistance FLOAT NOT NULL,
    idtAttackAtDistance BOOLEAN NOT NULL,
    PRIMARY KEY (codTroop)
);

CREATE TABLE Barrack (
    codBarrack INTEGER NOT NULL,
    codPart INTEGER NOT NULL REFERENCES Part (codPart),
    codTroop INTEGER NOT NULL REFERENCES Troop (codTroop),
    namBarrack VARCHAR NOT NULL,
    desBarrack VARCHAR NOT NULL,
    valSpawnFrequency INTEGER NOT NULL,
    valCost INTEGER NOT NULL,
    numTroopLimit INTEGER NOT NULL,
    PRIMARY KEY (codBarrack)
);

CREATE TABLE Tower (
    codTower INTEGER NOT NULL,
    valHp INTEGER NOT NULL,
    numEffectArea INTEGER NOT NULL,
    idtIsEnemy BOOLEAN NOT NULL,
    PRIMARY KEY (codTower)
);

CREATE TABLE Hero (
    codHero INTEGER NOT NULL,
    codPart INTEGER NOT NULL REFERENCES Part (codPart),
    namHero VARCHAR NOT NULL,
    desHero VARCHAR NOT NULL,
    txtAssetIdentifier VARCHAR NOT NULL,
    valHp INTEGER NOT NULL,
    valScore INTEGER NOT NULL,
    valDamageDealt INTEGER NOT NULL,
    valMotionSpeed FLOAT NOT NULL,
    valAttackSpeed FLOAT NOT NULL,
    valDropMoney INTEGER NOT NULL,
    valAttackDistance FLOAT NOT NULL,
    idtAttackAtDistance BOOLEAN NOT NULL,
    PRIMARY KEY (codHero)
);

CREATE TABLE Skill (
    codHero INTEGER NOT NULL REFERENCES Hero (codHero),
    codSkill INTEGER NOT NULL,
    namSkill VARCHAR NOT NULL,
    desSkill VARCHAR NOT NULL,
    txtAssetIdentifier VARCHAR NOT NULL,
    valDamage INTEGER,
    numEffectArea INTEGER,
    numCooldown INTEGER NOT NULL, -- milliseconds
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
    txtImagePath VARCHAR NOT NULL,
    PRIMARY KEY (codCutscene, codScene)
);

CREATE TABLE Speak (
    codCutscene INTEGER NOT NULL,
    codScene INTEGER NOT NULL,
    codSpeak INTEGER NOT NULL,
    txtSpeak VARCHAR NOT NULL,
    FOREIGN KEY (codCutscene, codScene) REFERENCES Scene (codCutscene, codScene),
    PRIMARY KEY (codCutscene, codScene, codSpeak)
);

-- "INSERT INTO" section

INSERT INTO AssetFilter (namTable, txtAssetFilter, txtAssetPath) VALUES
	('phase', 'phase', 'Prefabs/Phase'),
	('troop', 'troop', 'Prefabs/Troop'),
	('barrack', 'barrack', 'Prefabs/Barrack'),
	('tower', 'tower', 'Prefabs/Tower'),
	('hero', 'hero', 'Prefabs/Hero'),
	('skill', 'skill', 'Scriptable Objects/Skill'),
	('scene', 'scene', 'Sprites/Scene');

INSERT INTO Part (codPart, namPart) VALUES
	(1, 'Parte 1');

INSERT INTO Phase (codPart, numPhase, namPhase, valIniPlayerMoney, valIniIAMoney, idtPhaseType) VALUES
	(1, 1, 'Fase 1', 250, 200, 'Defense'),
	(1, 2, 'Fase 2', 350, 300, 'Attack');

INSERT INTO GameUser (idtGoogleAccount, numCurrentPhase, namUser) VALUES
	('abc123', 1, 'Nome do Usuário');
	
INSERT INTO Score (idtGoogleAccount, numPhase, valRecordPoints) VALUES
	('abc123', 1, 5000);

INSERT INTO Troop (codTroop, namTroop, txtAssetIdentifier, valDamageDealt, valHp, valScore, valMotionSpeed, valAttackSpeed, valDropMoney, valAttackDistance, idtAttackAtDistance) VALUES
	(1, 'Mage', 'Mage', 10, 20, 10, 1, 1, 20, 1, TRUE);

INSERT INTO Barrack (codBarrack, codPart, codTroop, namBarrack, desBarrack, valSpawnFrequency, valCost, numTroopLimit) VALUES
	(1, 1, 1, 'Caserna 1', 'Des. Caserna 1', 1, 100, 10);

INSERT INTO Tower (codTower, valHp, numEffectArea, idtIsEnemy) VALUES
	(1, 50, 5, FALSE),
	(2, 50, 5, TRUE);
	
INSERT INTO Hero (codHero, codPart, namHero, desHero, txtAssetIdentifier, valHp, valScore, valDamageDealt, valMotionSpeed, valAttackSpeed, valDropMoney, valAttackDistance, idtAttackAtDistance) VALUES
	(1, 1, 'Herói 1', 'Des. Herói 1', 'DefenseHero', 50, 1000, 5, 1, 1, 100, 1, FALSE);
	
INSERT INTO Skill (codHero, codSkill, namSkill, desSkill, txtAssetIdentifier, valDamage, numEffectArea, numCooldown, idtAttributeBuff) VALUES
	(1, 1, 'Habilidade 1', 'Des. Habilidade 1', 'Shield', NULL, NULL, 8000, TRUE),
	(1, 2, 'Habilidade 2', 'Des. Habilidade 2', 'Barrier', NULL, 5, 10000, FALSE);
	
INSERT INTO Cutscene (codCutscene, codPart) VALUES
	(1, 1);
	
INSERT INTO Scene (codCutscene, codScene, desScene, txtImagePath) VALUES
	(1, 1, 'Des. Cena 1.1', 'img1'), -- sem extensão
	(1, 2, 'Des. Cena 1.2', 'img2');
	
INSERT INTO Speak (codCutscene, codScene, codSpeak, txtSpeak) VALUES
	(1, 1, 1, 'Fala 1.1.1'),
	(1, 1, 2, 'Fala 1.1.2'),
	(1, 2, 1, 'Fala 1.2.1'),
	(1, 2, 2, 'Fala 1.2.2');
	