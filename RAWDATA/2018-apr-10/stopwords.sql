-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: stackoverflow_sample
-- ------------------------------------------------------
-- Server version	5.7.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `stopwords`
--

DROP TABLE IF EXISTS `stopwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stopwords` (
  `word` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stopwords`
--

LOCK TABLES `stopwords` WRITE;
/*!40000 ALTER TABLE `stopwords` DISABLE KEYS */;
INSERT INTO `stopwords` VALUES ('a\'s'),('able'),('about'),('above'),('according'),('accordingly'),('across'),('actually'),('after'),('afterwards'),('again'),('against'),('ain\'t'),('all'),('allow'),('allows'),('almost'),('alone'),('along'),('already'),('also'),('although'),('always'),('am'),('among'),('amongst'),('an'),('and'),('another'),('any'),('anybody'),('anyhow'),('anyone'),('anything'),('anyway'),('anyways'),('anywhere'),('apart'),('appear'),('appreciate'),('appropriate'),('are'),('aren\'t'),('around'),('as'),('aside'),('ask'),('asking'),('associated'),('at'),('available'),('away'),('awfully'),('be'),('became'),('because'),('become'),('becomes'),('becoming'),('been'),('before'),('beforehand'),('behind'),('being'),('believe'),('below'),('beside'),('besides'),('best'),('better'),('between'),('beyond'),('both'),('brief'),('but'),('by'),('c\'mon'),('c\'s'),('came'),('can'),('can\'t'),('cannot'),('cant'),('cause'),('causes'),('certain'),('certainly'),('changes'),('clearly'),('co'),('com'),('come'),('comes'),('concerning'),('consequently'),('consider'),('considering'),('contain'),('containing'),('contains'),('corresponding'),('could'),('couldn\'t'),('course'),('currently'),('definitely'),('described'),('despite'),('did'),('didn\'t'),('different'),('do'),('does'),('doesn\'t'),('doing'),('don\'t'),('done'),('down'),('downwards'),('during'),('each'),('edu'),('eg'),('eight'),('either'),('else'),('elsewhere'),('enough'),('entirely'),('especially'),('et'),('etc'),('even'),('ever'),('every'),('everybody'),('everyone'),('everything'),('everywhere'),('ex'),('exactly'),('example'),('except'),('far'),('few'),('fifth'),('first'),('five'),('followed'),('following'),('follows'),('for'),('former'),('formerly'),('forth'),('four'),('from'),('further'),('furthermore'),('get'),('gets'),('getting'),('given'),('gives'),('go'),('goes'),('going'),('gone'),('got'),('gotten'),('greetings'),('had'),('hadn\'t'),('happens'),('hardly'),('has'),('hasn\'t'),('have'),('haven\'t'),('having'),('he'),('he\'s'),('hello'),('help'),('hence'),('her'),('here'),('here\'s'),('hereafter'),('hereby'),('herein'),('hereupon'),('hers'),('herself'),('hi'),('him'),('himself'),('his'),('hither'),('hopefully'),('how'),('howbeit'),('however'),('i\'d'),('i\'ll'),('i\'m'),('i\'ve'),('ie'),('if'),('ignored'),('immediate'),('in'),('inasmuch'),('inc'),('indeed'),('indicate'),('indicated'),('indicates'),('inner'),('insofar'),('instead'),('into'),('inward'),('is'),('isn\'t'),('it'),('it\'d'),('it\'ll'),('it\'s'),('its'),('itself'),('just'),('keep'),('keeps'),('kept'),('know'),('knows'),('known'),('last'),('lately'),('later'),('latter'),('latterly'),('least'),('less'),('lest'),('let'),('let\'s'),('like'),('liked'),('likely'),('little'),('look'),('looking'),('looks'),('ltd'),('mainly'),('many'),('may'),('maybe'),('me'),('mean'),('meanwhile'),('merely'),('might'),('more'),('moreover'),('most'),('mostly'),('much'),('must'),('my'),('myself'),('name'),('namely'),('nd'),('near'),('nearly'),('necessary'),('need'),('needs'),('neither'),('never'),('nevertheless'),('new'),('next'),('nine'),('no'),('nobody'),('non'),('none'),('noone'),('nor'),('normally'),('not'),('nothing'),('novel'),('now'),('nowhere'),('obviously'),('of'),('off'),('often'),('oh'),('ok'),('okay'),('old'),('on'),('once'),('one'),('ones'),('only'),('onto'),('or'),('other'),('others'),('otherwise'),('ought'),('our'),('ours'),('ourselves'),('out'),('outside'),('over'),('overall'),('own'),('particular'),('particularly'),('per'),('perhaps'),('placed'),('please'),('plus'),('possible'),('presumably'),('probably'),('provides'),('que'),('quite'),('qv'),('rather'),('rd'),('re'),('really'),('reasonably'),('regarding'),('regardless'),('regards'),('relatively'),('respectively'),('right'),('said'),('same'),('saw'),('say'),('saying'),('says'),('second'),('secondly'),('see'),('seeing'),('seem'),('seemed'),('seeming'),('seems'),('seen'),('self'),('selves'),('sensible'),('sent'),('serious'),('seriously'),('seven'),('several'),('shall'),('she'),('should'),('shouldn\'t'),('since'),('six'),('so'),('some'),('somebody'),('somehow'),('someone'),('something'),('sometime'),('sometimes'),('somewhat'),('somewhere'),('soon'),('sorry'),('specified'),('specify'),('specifying'),('still'),('sub'),('such'),('sup'),('sure'),('t\'s'),('take'),('taken'),('tell'),('tends'),('th'),('than'),('thank'),('thanks'),('thanx'),('that'),('that\'s'),('thats'),('the'),('their'),('theirs'),('them'),('themselves'),('then'),('thence'),('there'),('there\'s'),('thereafter'),('thereby'),('therefore'),('therein'),('theres'),('thereupon'),('these'),('they'),('they\'d'),('they\'ll'),('they\'re'),('they\'ve'),('think'),('third'),('this'),('thorough'),('thoroughly'),('those'),('though'),('three'),('through'),('throughout'),('thru'),('thus'),('to'),('together'),('too'),('took'),('toward'),('towards'),('tried'),('tries'),('truly'),('try'),('trying'),('twice'),('two'),('un'),('under'),('unfortunately'),('unless'),('unlikely'),('until'),('unto'),('up'),('upon'),('us'),('use'),('used'),('useful'),('uses'),('using'),('usually'),('value'),('various'),('very'),('via'),('viz'),('vs'),('want'),('wants'),('was'),('wasn\'t'),('way'),('we'),('we\'d'),('we\'ll'),('we\'re'),('we\'ve'),('welcome'),('well'),('went'),('were'),('weren\'t'),('what'),('what\'s'),('whatever'),('when'),('whence'),('whenever'),('where'),('where\'s'),('whereafter'),('whereas'),('whereby'),('wherein'),('whereupon'),('wherever'),('whether'),('which'),('while'),('whither'),('who'),('who\'s'),('whoever'),('whole'),('whom'),('whose'),('why'),('will'),('willing'),('wish'),('with'),('within'),('without'),('won\'t'),('wonder'),('would'),('wouldn\'t'),('yes'),('yet'),('you'),('you\'d'),('you\'ll'),('you\'re'),('you\'ve'),('your'),('yours'),('yourself'),('yourselves'),('zero');
/*!40000 ALTER TABLE `stopwords` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-11 20:39:46
