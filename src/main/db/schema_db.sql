
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
	(1, 'Parte 1'),
    (2, 'Parte 2'),
    (3, 'Parte 3'),
    (4, 'Parte 4');

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
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

	
INSERT INTO Scene (codCutscene, codScene, desScene, txtImagePath) VALUES
	(1, 1, 'O Começo', 'img1-1'), -- sem extensão
	(1, 2, 'Certamente um Bom Dia', 'img1-2'),
    (1, 3, 'O Pedido', 'img1-3'),
	(1, 4, 'Guerra', 'img1-1'),
    (2, 1, 'Alguém Mais Inteligente', 'img2-1'),
    (3, 1, 'Os Impérios Contra-atacam', 'img3-1'),
    (4, 1, 'O Fim', 'img4-1');


INSERT INTO Speak (codCutscene, codScene, codSpeak, txtSpeak) VALUES
	(1, 1, 1, 'Durante a era medieval, existiam dois reinos vizinhos: Pharian e Herentil, eles vivenciavam um período de grandes inovações tecnológicas e há eras a paz reinava no continente. '),
	(1, 1, 2, 'Cada reino possuía um recurso único e seus nomes foram inspirados nesse recurso. Em Herentil há um mineral chamado herentium, que, se usado de maneira certa, é uma poderosa fonte de energia limpa.'),
	(1, 1, 3, 'E Phariunt, de Pharian. É um metal puríssimo e extremamente maleável, mas  ao ser infuso em mana torna-se quase indestrutível. Obviamente esses países desenvolveram os métodos capazes de manejar esses recursos.'),
	(1, 1, 4, 'E esse mérito é de dois sábios magos que estudaram cada qual seu recurso de maneira perspicaz e incansável. E era graças a eles que tal desenvolvimento ocorria nos reinos.'),    

	(1, 2, 1, 'Certo dia, o mago de Pharian, Ganmor, acordou, abriu as cortinas de seu quarto e pensou: “Mas que belo dia, seria legal ter um pouco de Herentium… Bom, acho que hoje é um belo dia para se invadir um país, não é mesmo?”'),
	(1, 2, 2, 'Sim, ele fala sozinho, é bem mais comum do que parece, mas ainda é um pouco estranho. E sim, eu sou um narrador contratado para narrar essa história. Acho que também irei conversar com você em alguns momentos, o que poderia dar errado... não é mesmo?'),
    (1, 2, 3, 'Voltando à história. Horas depois, ocorreu uma audiência com o rei na qual o mago o convenceu da necessidade de se obter Herentium e estudar a magnífica fonte de energia.'),
    
    (1, 3, 1, 'Convencido, o rei de Pharian envia uma mensagem para Herentil, requisitando o recurso. Mas o mago de Herentil, Kalus, afirma que o recurso é de extrema importância para a sobrevivência de seu reino, portanto não pode ser cedido.'),

	(1, 4, 1, 'Logo após receber a resposta de Herentil, Pharian reuniu seu exército e declarou guerra ao país vizinho. E você, agora líder do exército de Herentil, deve enfrentar e vencer o inimigo em todos os fronts de batalha para que seu reino se saia vitorioso.'),
    (1, 4, 2, 'Mas claramente você é um general inexperiente, na verdade, me pergunto por que está nesse cargo. Mas nunca é tarde para aprender, ou espero que não seja...Bom, venha, irei te ensinar a arte da guerra.'),
    (1, 4, 3, 'Mas não agora, por algum motivo que desconheço, tem um pato cercando a cabine de narração e não estou gostando muito disso. Enfim… saiba que o treinamento é o primeiro passo para se tornar um herói do (QUACK).'),

    (2, 1, 1, 'Horas após a batalha, em algum lugar definitivamente bem escondido na capital de Pharian. Um homem sentado em frente a sua lareira bebe vinho enquanto se deleita fazendo um longo monólogo sobre o sucesso de seu plano.'),
    (2, 1, 2, 'Mas que plano? Bom… vamos ouvir, ou melhor, ler o que ele tem a dizer.'),
    (2, 1, 3, '“Olha só, obviamente está tudo indo como planejado. Após implantar a ideia de invasão na mente de Ganmor e outros ajustes e subornos, tudo fluiu como imaginei.”'),
    (2, 1, 4, 'Ele fala sozinho por mais alguns momentos, explicando minuciosamente seu plano como se seu interlocutor imaginário fosse um completo imbecil. Soa como um diálogo mal feito de um filme ruim. Enfim, te pouparei disso e pularei para o final do discurso, de nada.'),
    (2, 1, 5, '“Em algumas batalhas ambos os reinos se destruirão e eu, Melthan, surgirei como salvador do povo e governarei tudo, será lindo! É como dizia aquele velho ditado: Há sempre alguém mais inteligente manipulando tudo por trás das cortinas, hahaha!”'),
    (2, 1, 6, 'Realmente alguém mais inteligente, já sobre a humildade…Sem falar da risada maléfica, isso aqui já é quase um filme B.'),

    (3, 1, 1, 'O plano de Melthan não foi um exato sucesso, ele não contava com um fator, você! Seja lá qual o seu nome, você derrotou o reino de Pharian e a batalha não foi um colapso total.'),
    (3, 1, 2, 'Mas ao perceber que a derrota era certa, Melthan juntou o que sobrava do exército Phariano com seu exército pessoal. E agora deseja acabar com isso ele mesmo.'),
    (3, 1, 3, 'Seu último objetivo agora é derrotar o velho nobre junto de seu exército e retomar a autonomia de antigamente.'),
    (3, 1, 4, 'Vá, General! Lidere o império, derrote o inimigo e restaure os reinos. Seja um herói do (QUACK, o pato invade a sala e ataca o narrador que sai gritando assustado, e sim, sou um segundo narrador contratado só pra falar isso porque foi realmente engraçado.)'),

    (4, 1, 1, 'O que aconteceu? Desculpe, não consegui ver a batalha, estava tentando SALVAR MINHA VIDA DAQUELE PATO ASSASSINO.Enfim… estou bem.'),
    (4, 1, 2, 'Pelo que vejo a vitória foi sua, meus parabéns. Agora ambos os reinos ficarão em paz, e você será devidamente recompensado por ser aquele que acabou com a guerra. Quem sabe até ocorra um acordo de cooperação entre os reinos futuramente.'),
    (4, 1, 3, 'Tenho um presente para você, um que será melhor do que qualquer tesouro que ganhe, é um conselho que deverá levar para toda a vida: Jamais, JAMAIS confie em um pato! Com isso me despeço, foi uma grande aventura! Adeus! Leve uma boa vida, General!');
    
	