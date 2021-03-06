
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
	('abc123', 1, 'Nome do Usu??rio');
	
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
	(1, 1, 'Her??i 1', 'Des. Her??i 1', 'DefenseHero', 50, 1000, 5, 1, 1, 100, 1, FALSE);
	
INSERT INTO Skill (codHero, codSkill, namSkill, desSkill, txtAssetIdentifier, valDamage, numEffectArea, numCooldown, idtAttributeBuff) VALUES
	(1, 1, 'Habilidade 1', 'Des. Habilidade 1', 'Shield', NULL, NULL, 8000, TRUE),
	(1, 2, 'Habilidade 2', 'Des. Habilidade 2', 'Barrier', NULL, 5, 10000, FALSE);
	
INSERT INTO Cutscene (codCutscene, codPart) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

	
INSERT INTO Scene (codCutscene, codScene, desScene, txtImagePath) VALUES
	(1, 1, 'O Come??o', 'img1-1'), -- sem extens??o
	(1, 2, 'Certamente um Bom Dia', 'img1-2'),
    (1, 3, 'O Pedido', 'img1-3'),
	(1, 4, 'Guerra', 'img1-1'),
    (2, 1, 'Algu??m Mais Inteligente', 'img2-1'),
    (3, 1, 'Os Imp??rios Contra-atacam', 'img3-1'),
    (4, 1, 'O Fim', 'img4-1');


INSERT INTO Speak (codCutscene, codScene, codSpeak, txtSpeak) VALUES
	(1, 1, 1, 'Durante a era medieval, existiam dois reinos vizinhos: Pharian e Herentil, eles vivenciavam um per??odo de grandes inova????es tecnol??gicas e h?? eras a paz reinava no continente. '),
	(1, 1, 2, 'Cada reino possu??a um recurso ??nico e seus nomes foram inspirados nesse recurso. Em Herentil h?? um mineral chamado herentium, que, se usado de maneira certa, ?? uma poderosa fonte de energia limpa.'),
	(1, 1, 3, 'E Phariunt, de Pharian. ?? um metal pur??ssimo e extremamente male??vel, mas  ao ser infuso em mana torna-se quase indestrut??vel. Obviamente esses pa??ses desenvolveram os m??todos capazes de manejar esses recursos.'),
	(1, 1, 4, 'E esse m??rito ?? de dois s??bios magos que estudaram cada qual seu recurso de maneira perspicaz e incans??vel. E era gra??as a eles que tal desenvolvimento ocorria nos reinos.'),    

	(1, 2, 1, 'Certo dia, o mago de Pharian, Ganmor, acordou, abriu as cortinas de seu quarto e pensou: ???Mas que belo dia, seria legal ter um pouco de Herentium??? Bom, acho que hoje ?? um belo dia para se invadir um pa??s, n??o ?? mesmo????'),
	(1, 2, 2, 'Sim, ele fala sozinho, ?? bem mais comum do que parece, mas ainda ?? um pouco estranho. E sim, eu sou um narrador contratado para narrar essa hist??ria. Acho que tamb??m irei conversar com voc?? em alguns momentos, o que poderia dar errado... n??o ?? mesmo?'),
    (1, 2, 3, 'Voltando ?? hist??ria. Horas depois, ocorreu uma audi??ncia com o rei na qual o mago o convenceu da necessidade de se obter Herentium e estudar a magn??fica fonte de energia.'),
    
    (1, 3, 1, 'Convencido, o rei de Pharian envia uma mensagem para Herentil, requisitando o recurso. Mas o mago de Herentil, Kalus, afirma que o recurso ?? de extrema import??ncia para a sobreviv??ncia de seu reino, portanto n??o pode ser cedido.'),

	(1, 4, 1, 'Logo ap??s receber a resposta de Herentil, Pharian reuniu seu ex??rcito e declarou guerra ao pa??s vizinho. E voc??, agora l??der do ex??rcito de Herentil, deve enfrentar e vencer o inimigo em todos os fronts de batalha para que seu reino se saia vitorioso.'),
    (1, 4, 2, 'Mas claramente voc?? ?? um general inexperiente, na verdade, me pergunto por que est?? nesse cargo. Mas nunca ?? tarde para aprender, ou espero que n??o seja...Bom, venha, irei te ensinar a arte da guerra.'),
    (1, 4, 3, 'Mas n??o agora, por algum motivo que desconhe??o, tem um pato cercando a cabine de narra????o e n??o estou gostando muito disso. Enfim??? saiba que o treinamento ?? o primeiro passo para se tornar um her??i do (QUACK).'),

    (2, 1, 1, 'Horas ap??s a batalha, em algum lugar definitivamente bem escondido na capital de Pharian. Um homem sentado em frente a sua lareira bebe vinho enquanto se deleita fazendo um longo mon??logo sobre o sucesso de seu plano.'),
    (2, 1, 2, 'Mas que plano? Bom??? vamos ouvir, ou melhor, ler o que ele tem a dizer.'),
    (2, 1, 3, '???Olha s??, obviamente est?? tudo indo como planejado. Ap??s implantar a ideia de invas??o na mente de Ganmor e outros ajustes e subornos, tudo fluiu como imaginei.???'),
    (2, 1, 4, 'Ele fala sozinho por mais alguns momentos, explicando minuciosamente seu plano como se seu interlocutor imagin??rio fosse um completo imbecil. Soa como um di??logo mal feito de um filme ruim. Enfim, te pouparei disso e pularei para o final do discurso, de nada.'),
    (2, 1, 5, '???Em algumas batalhas ambos os reinos se destruir??o e eu, Melthan, surgirei como salvador do povo e governarei tudo, ser?? lindo! ?? como dizia aquele velho ditado: H?? sempre algu??m mais inteligente manipulando tudo por tr??s das cortinas, hahaha!???'),
    (2, 1, 6, 'Realmente algu??m mais inteligente, j?? sobre a humildade???Sem falar da risada mal??fica, isso aqui j?? ?? quase um filme B.'),

    (3, 1, 1, 'O plano de Melthan n??o foi um exato sucesso, ele n??o contava com um fator, voc??! Seja l?? qual o seu nome, voc?? derrotou o reino de Pharian e a batalha n??o foi um colapso total.'),
    (3, 1, 2, 'Mas ao perceber que a derrota era certa, Melthan juntou o que sobrava do ex??rcito Phariano com seu ex??rcito pessoal. E agora deseja acabar com isso ele mesmo.'),
    (3, 1, 3, 'Seu ??ltimo objetivo agora ?? derrotar o velho nobre junto de seu ex??rcito e retomar a autonomia de antigamente.'),
    (3, 1, 4, 'V??, General! Lidere o imp??rio, derrote o inimigo e restaure os reinos. Seja um her??i do (QUACK, o pato invade a sala e ataca o narrador que sai gritando assustado, e sim, sou um segundo narrador contratado s?? pra falar isso porque foi realmente engra??ado.)'),

    (4, 1, 1, 'O que aconteceu? Desculpe, n??o consegui ver a batalha, estava tentando SALVAR MINHA VIDA DAQUELE PATO ASSASSINO.Enfim??? estou bem.'),
    (4, 1, 2, 'Pelo que vejo a vit??ria foi sua, meus parab??ns. Agora ambos os reinos ficar??o em paz, e voc?? ser?? devidamente recompensado por ser aquele que acabou com a guerra. Quem sabe at?? ocorra um acordo de coopera????o entre os reinos futuramente.'),
    (4, 1, 3, 'Tenho um presente para voc??, um que ser?? melhor do que qualquer tesouro que ganhe, ?? um conselho que dever?? levar para toda a vida: Jamais, JAMAIS confie em um pato! Com isso me despe??o, foi uma grande aventura! Adeus! Leve uma boa vida, General!');
    
	