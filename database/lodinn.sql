-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Ápr 28. 15:14
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `lodinn`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ar`
--

CREATE TABLE `ar` (
  `kategoriaAr_ID` int(11) NOT NULL,
  `foglAr_ID` int(11) NOT NULL,
  `kutyaAr_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `arai`
--

CREATE TABLE `arai` (
  `kategoria_ID` int(11) NOT NULL,
  `panzio_ID` int(11) NOT NULL,
  `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `arai`
--

INSERT INTO `arai` (`kategoria_ID`, `panzio_ID`, `ar`) VALUES
(1, 1, 2500),
(2, 1, 1000),
(3, 1, 2000),
(5, 2, 4500),
(7, 1, 3000),
(9, 1, 5500);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `arak`
--

CREATE TABLE `arak` (
  `kategoriaID` int(11) NOT NULL,
  `kategoriaNev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `arak`
--

INSERT INTO `arak` (`kategoriaID`, `kategoriaNev`) VALUES
(1, 'fürdetés'),
(2, 'sétáltatás'),
(3, 'tanítás'),
(5, 'kis kennel'),
(6, 'nagy kennel'),
(7, 'kozmetika'),
(8, 'külön kennel'),
(9, 'alapár');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dolgozok`
--

CREATE TABLE `dolgozok` (
  `dolgozoID` int(11) NOT NULL,
  `vezNev` varchar(50) NOT NULL,
  `kerNev` varchar(50) NOT NULL,
  `felh_ID` int(11) NOT NULL,
  `panzio_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `dolgozok`
--

INSERT INTO `dolgozok` (`dolgozoID`, `vezNev`, `kerNev`, `felh_ID`, `panzio_ID`) VALUES
(3, 'Teszt', 'Dolgozó', 11, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `felhID` int(11) NOT NULL,
  `felhNev` varchar(50) NOT NULL,
  `jelszo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`felhID`, `felhNev`, `jelszo`) VALUES
(9, 'tesztelek', '$2y$10$dP3i45xNj17xYGxzHRm/y.kWO7aewR.Q8rVbCUW9zvSA97ley6Xny'),
(11, 'dolgozo', '$2y$10$5giAfmKSSQk9dAOSCuYhAu41eIUMG503cnAoK7keKFKre0g0YF2ru');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `foglalasok`
--

CREATE TABLE `foglalasok` (
  `foglID` int(11) NOT NULL,
  `rogzites` datetime DEFAULT current_timestamp(),
  `panzio_ID` int(11) NOT NULL,
  `vegosszeg` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `foglalasok`
--

INSERT INTO `foglalasok` (`foglID`, `rogzites`, `panzio_ID`, `vegosszeg`) VALUES
(130, '2023-04-28 10:05:28', 1, 22000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hirek`
--

CREATE TABLE `hirek` (
  `hirID` int(11) NOT NULL,
  `cim` varchar(50) NOT NULL,
  `leiras` varchar(1000) NOT NULL,
  `datum` datetime DEFAULT current_timestamp(),
  `panzio_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `hirek`
--

INSERT INTO `hirek` (`hirID`, `cim`, `leiras`, `datum`, `panzio_ID`) VALUES
(1, 'Hamarosan megnyitjuk kapuinkat!', 'A Lodinn Kutypanzió 2023. április 28-án, pénteken megnyitja kaput a négylábú kedvencek előtt. Nyitáskor garantált kedvezményekre számíthat minden gazdi!', '2023-04-28 09:24:01', 1),
(2, 'Kozmetikai szolgáltatásaink', 'Kutyusod egészsége szempontjából is fontos, hogy a megfelelő kozmetikai szolgáltatásokat megkapja. Mi ezt szakértő kollégáink segítségével biztosíthatjuk számára!', '2023-04-28 09:24:41', 1),
(3, 'Tanítás', 'Ha nálunk száll meg kutyusod, akkor kérheted az itt tartózkodása alatt a tanítás szolgáltatásunkat.', '2023-04-28 09:25:43', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kepek`
--

CREATE TABLE `kepek` (
  `kepID` int(11) NOT NULL,
  `kepNev` varchar(50) NOT NULL,
  `kepUtvonal` varchar(1000) NOT NULL,
  `panzio_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kepek`
--

INSERT INTO `kepek` (`kepID`, `kepNev`, `kepUtvonal`, `panzio_ID`) VALUES
(1, 'loadergif', 'assets/images/loadergif.gif', 1),
(2, 'logo', 'assets/images/dog3.png', 1),
(3, 'carousel1', 'assets/images/puppies.webp', 1),
(4, 'carousel2', 'assets/images/group-portrait-adorable-puppies.webp', 1),
(5, 'carousel3', 'assets/images/portrait-collection-adorable-puppies.webp', 1),
(6, 'bone', 'assets/images/bone.png', 1),
(7, 'customer1', 'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=761&q=80', 1),
(8, 'customer2', 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80', 1),
(9, 'customer3', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 1),
(10, 'dog-pow', 'assets/images/pngfind.com-dog-paw-png-337026.png', 1),
(11, 'furdetes', 'assets/images/furdetes.jpg', 1),
(12, 'setaltatas', 'assets/images/setaltatas.jpg', 1),
(13, 'tanitas', 'assets/images/tanitas.jpg', 1),
(14, 'kozmetika', 'assets/images/kozmetika.jpg', 1),
(15, 'loader-dog', 'assets/images/dog.gif', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kutyak`
--

CREATE TABLE `kutyak` (
  `kutyaID` int(11) NOT NULL,
  `kutyaNev` varchar(30) NOT NULL,
  `kor` int(11) DEFAULT 1,
  `fajta` varchar(30) DEFAULT NULL,
  `vendeg_ID` int(11) NOT NULL,
  `rogzites` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kutyak`
--

INSERT INTO `kutyak` (`kutyaID`, `kutyaNev`, `kor`, `fajta`, `vendeg_ID`, `rogzites`) VALUES
(74, 'Lola', 9, 'husky', 34, '2023-04-28 10:05:28');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `linkek`
--

CREATE TABLE `linkek` (
  `linkID` int(11) NOT NULL,
  `linkNev` varchar(50) NOT NULL,
  `link` varchar(2050) NOT NULL,
  `panzio_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `linkek`
--

INSERT INTO `linkek` (`linkID`, `linkNev`, `link`, `panzio_ID`) VALUES
(1, 'facebook', 'https://www.facebook.com/profile.php?id=100091656457423', 1),
(2, 'instagram', 'https://www.instagram.com/lodinnkutyapanzio/', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `panziok`
--

CREATE TABLE `panziok` (
  `panzioID` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `telszam` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `kapacitas` int(11) NOT NULL,
  `iranyitoszam` int(11) NOT NULL,
  `megye` varchar(50) NOT NULL,
  `varos` varchar(50) NOT NULL,
  `utca` varchar(50) DEFAULT NULL,
  `adoszam` varchar(20) DEFAULT NULL,
  `cegjegyzek` varchar(20) DEFAULT NULL,
  `engedely` varchar(20) DEFAULT NULL,
  `hazszam` varchar(10) DEFAULT NULL,
  `bemutatkozas` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `panziok`
--

INSERT INTO `panziok` (`panzioID`, `nev`, `telszam`, `email`, `kapacitas`, `iranyitoszam`, `megye`, `varos`, `utca`, `adoszam`, `cegjegyzek`, `engedely`, `hazszam`, `bemutatkozas`) VALUES
(1, 'LodInn', '+36301234567', 'lodinn@lodinn.hu', 3, 6782, 'Csongrád-Csanád vármegye', 'Mórahalom', 'Dosztig köz', '16518611', '12135486161', '13616/31321', '3.', 'A LodInn kutyapanzió megbízható, kedves és szakértő munkatársai biztosítják a családias, kényelmes és biztonságos átmeneti otthont házikedvencének. A külön töltött idő kutyusától nyugalomban telhet, hiszen biztosítjuk arról, hogy megfelelő bánásmódban részesítjük az összes nálunk vendégeskedő szőrmókot.'),
(2, 'EbPanzio', '06204066649', 'ebpanzi@panzi.hu', 10, 6771, 'Csongrád-Csanád vármegye', 'Szeged', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tartozik`
--

CREATE TABLE `tartozik` (
  `kezdoDatum` date NOT NULL,
  `vegDatum` date NOT NULL,
  `szallitas` tinyint(1) NOT NULL,
  `specialisIgenyek` varchar(1000) DEFAULT NULL,
  `kutya_ID` int(11) NOT NULL,
  `fogl_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `tartozik`
--

INSERT INTO `tartozik` (`kezdoDatum`, `vegDatum`, `szallitas`, `specialisIgenyek`, `kutya_ID`, `fogl_ID`) VALUES
('2023-05-02', '2023-05-04', 1, '', 74, 130);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vendegek`
--

CREATE TABLE `vendegek` (
  `vendegID` int(11) NOT NULL,
  `vezNev` varchar(50) NOT NULL,
  `kerNev` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telszam` varchar(20) NOT NULL,
  `iranyitoszam` int(11) DEFAULT NULL,
  `megye` varchar(50) DEFAULT NULL,
  `varos` varchar(50) DEFAULT NULL,
  `utca` varchar(50) DEFAULT NULL,
  `hazszam` varchar(10) DEFAULT NULL,
  `felh_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `vendegek`
--

INSERT INTO `vendegek` (`vendegID`, `vezNev`, `kerNev`, `email`, `telszam`, `iranyitoszam`, `megye`, `varos`, `utca`, `hazszam`, `felh_ID`) VALUES
(34, 'Teszt', 'Elek', 'tesztelek@teszt.hu', '+36(90)123-4567', 6770, 'Csongrád-Csanád vármegye', 'Szeged', 'Teszt u.', '1', 9);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ar`
--
ALTER TABLE `ar`
  ADD PRIMARY KEY (`kategoriaAr_ID`,`foglAr_ID`,`kutyaAr_ID`),
  ADD KEY `foglAr_ID` (`foglAr_ID`),
  ADD KEY `kutyaAr_ID` (`kutyaAr_ID`);

--
-- A tábla indexei `arai`
--
ALTER TABLE `arai`
  ADD PRIMARY KEY (`kategoria_ID`,`panzio_ID`),
  ADD KEY `panzio_ID` (`panzio_ID`);

--
-- A tábla indexei `arak`
--
ALTER TABLE `arak`
  ADD PRIMARY KEY (`kategoriaID`);

--
-- A tábla indexei `dolgozok`
--
ALTER TABLE `dolgozok`
  ADD PRIMARY KEY (`dolgozoID`),
  ADD UNIQUE KEY `felh_ID` (`felh_ID`),
  ADD KEY `panzio_ID` (`panzio_ID`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`felhID`);

--
-- A tábla indexei `foglalasok`
--
ALTER TABLE `foglalasok`
  ADD PRIMARY KEY (`foglID`),
  ADD KEY `panzio_ID` (`panzio_ID`);

--
-- A tábla indexei `hirek`
--
ALTER TABLE `hirek`
  ADD PRIMARY KEY (`hirID`),
  ADD KEY `panzio_ID` (`panzio_ID`);

--
-- A tábla indexei `kepek`
--
ALTER TABLE `kepek`
  ADD PRIMARY KEY (`kepID`),
  ADD KEY `panzio_ID` (`panzio_ID`);

--
-- A tábla indexei `kutyak`
--
ALTER TABLE `kutyak`
  ADD PRIMARY KEY (`kutyaID`),
  ADD KEY `vendeg_ID` (`vendeg_ID`);

--
-- A tábla indexei `linkek`
--
ALTER TABLE `linkek`
  ADD PRIMARY KEY (`linkID`),
  ADD KEY `panzio_ID` (`panzio_ID`);

--
-- A tábla indexei `panziok`
--
ALTER TABLE `panziok`
  ADD PRIMARY KEY (`panzioID`);

--
-- A tábla indexei `tartozik`
--
ALTER TABLE `tartozik`
  ADD PRIMARY KEY (`kutya_ID`,`fogl_ID`),
  ADD KEY `fogl_ID` (`fogl_ID`);

--
-- A tábla indexei `vendegek`
--
ALTER TABLE `vendegek`
  ADD PRIMARY KEY (`vendegID`),
  ADD UNIQUE KEY `felh_ID` (`felh_ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `arak`
--
ALTER TABLE `arak`
  MODIFY `kategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `dolgozok`
--
ALTER TABLE `dolgozok`
  MODIFY `dolgozoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felhID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `foglalasok`
--
ALTER TABLE `foglalasok`
  MODIFY `foglID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT a táblához `hirek`
--
ALTER TABLE `hirek`
  MODIFY `hirID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `kepek`
--
ALTER TABLE `kepek`
  MODIFY `kepID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `kutyak`
--
ALTER TABLE `kutyak`
  MODIFY `kutyaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT a táblához `linkek`
--
ALTER TABLE `linkek`
  MODIFY `linkID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `panziok`
--
ALTER TABLE `panziok`
  MODIFY `panzioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `vendegek`
--
ALTER TABLE `vendegek`
  MODIFY `vendegID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `ar`
--
ALTER TABLE `ar`
  ADD CONSTRAINT `ar_ibfk_1` FOREIGN KEY (`kategoriaAr_ID`) REFERENCES `arak` (`kategoriaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ar_ibfk_2` FOREIGN KEY (`foglAr_ID`) REFERENCES `tartozik` (`fogl_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ar_ibfk_3` FOREIGN KEY (`kutyaAr_ID`) REFERENCES `tartozik` (`kutya_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `arai`
--
ALTER TABLE `arai`
  ADD CONSTRAINT `arai_ibfk_1` FOREIGN KEY (`kategoria_ID`) REFERENCES `arak` (`kategoriaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arai_ibfk_2` FOREIGN KEY (`panzio_ID`) REFERENCES `panziok` (`panzioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `dolgozok`
--
ALTER TABLE `dolgozok`
  ADD CONSTRAINT `dolgozok_ibfk_1` FOREIGN KEY (`felh_ID`) REFERENCES `felhasznalok` (`felhID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dolgozok_ibfk_2` FOREIGN KEY (`panzio_ID`) REFERENCES `panziok` (`panzioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `foglalasok`
--
ALTER TABLE `foglalasok`
  ADD CONSTRAINT `foglalasok_ibfk_1` FOREIGN KEY (`panzio_ID`) REFERENCES `panziok` (`panzioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `hirek`
--
ALTER TABLE `hirek`
  ADD CONSTRAINT `hirek_ibfk_1` FOREIGN KEY (`panzio_ID`) REFERENCES `panziok` (`panzioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `kepek`
--
ALTER TABLE `kepek`
  ADD CONSTRAINT `kepek_ibfk_1` FOREIGN KEY (`panzio_ID`) REFERENCES `panziok` (`panzioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `kutyak`
--
ALTER TABLE `kutyak`
  ADD CONSTRAINT `kutyak_ibfk_1` FOREIGN KEY (`vendeg_ID`) REFERENCES `vendegek` (`vendegID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `linkek`
--
ALTER TABLE `linkek`
  ADD CONSTRAINT `linkek_ibfk_1` FOREIGN KEY (`panzio_ID`) REFERENCES `panziok` (`panzioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `tartozik`
--
ALTER TABLE `tartozik`
  ADD CONSTRAINT `tartozik_ibfk_1` FOREIGN KEY (`kutya_ID`) REFERENCES `kutyak` (`kutyaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tartozik_ibfk_2` FOREIGN KEY (`fogl_ID`) REFERENCES `foglalasok` (`foglID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `vendegek`
--
ALTER TABLE `vendegek`
  ADD CONSTRAINT `vendegek_ibfk_1` FOREIGN KEY (`felh_ID`) REFERENCES `felhasznalok` (`felhID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
