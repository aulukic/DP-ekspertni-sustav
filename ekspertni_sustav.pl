start:-
problem(Greska),
write('Pretpostavljena pogreška'),
write(Greska),
nl,
write('Dijagnostika završena.'),
nl,
undo.
/*problemi koje se mogu testirati*/
problem(hardware)     :- hardware, !.
problem(software)      :- software, !.
problem(network)  :- network, !.
problem(performance)  :- performance, !.
problem(operating_system)  :- operating_system, !.
problem(nepoznato).
/* pravila za identificiranje pogrešaka */
hardware :-
simptom(pregrijavanje),
simptom(neispravan_ram),
simptom(neispravno_napajanje),
write('Savjeti i prijedloi:'),
nl,
write('1: Računalo se pregrijava zbog neispravnog ventilatora ili lošeg protoka zraka'),
nl,
write('2: Računalo se često ruši ili prikazuje plavi ekran smrti (BSOD)ukoliko imate neispravan RAM modul, ili ako modul nije ispravno postavljen na matičnu ploču'),
nl,
write('3: Računalo se ne uključuje ili se iznenada gasi ukoliko je napajanje neiispravno te ga je potrebno zamjeniti'),
nl,
write('Neke od ovih simptoma se mogu provjeriti u Task Manageru kombinacijom tipki Ctrl+Shift+Esc u odjeljku Performance'),
nl.
software :-
simptom(driver),
simptom(sukobi),
simptom(malware),
simptom(app_crash),
simptom(compatibility),
write('Savjeti i prijedlozi:'),
nl,
write('1: •	Zastarjeli upravljački programi (driveri): Problemi s perifernim uređajima kao što su pisači ili skeneri, te ih je potrebno preuzeti i ažurirati s njihovih službenih stranica'),
nl,
write('2: •	Sukobi softvera: Dva ili više programa uzrokuju nestabilnost sustava, ovaj problem se zna dogoditi kada na OSu imate instalirano i aktivno dva ili više antivirusna programa istovremeno'),
nl,
write('3: Računalo je zaraženo virusima ili spywareom, što uzrokuje spor rad ili neobično ponašanje'),
nl,
write('4: •	Pad aplikacija: Aplikacije se često ruše ili ne odgovaraju'),
nl,
write('5: •	Kompatibilnost: Aplikacije nisu kompatibilne s operativnim sustavom ili drugim softverom'),
nl,
write('Ove probleme je moguće riještit instaliranjem JEDNOG antivirusnog programa ili ažuriranjem postojećeg zastarjelog softwarea'),
nl.
network :-
simptom(no_internet_connection),
simptom(slow_internet_speed),
simptom(wifi),
write('Savjeti i prijedlozi:'),
nl,
write('1: •	Nema internetske veze: Računalo se ne može povezati na internet ukoliko je mrežna kartica neispravna ili nema potreban driver za rad'),
nl,
write('2: Brzina interneta je znatno niža od očekivane, potrebno ugasiti/pauzirati torrent klijent te ponovno provjeriti'),
nl,
write('3: Računalo se ne može povezati na Wi-Fi mrežu ili često gubi vezu'),
nl,
write('Problemi s mrežom i povezivanjem na internet se često mogu tiještit resetiranjem mreže te ponovnim prespajanjem'),
nl.
performance :-
simptom(ram_management),
simptom(high_cpu_usage),
simptom(low_disk_space),

write('Savjeti i prijedlozi:'),
nl,
write('1: Računalo radi sporo zbog previše pokrenutih programa ili nedostatka RAM-a'),
nl,
write('2: je stalno na visokom opterećenju, što usporava rad računala'),
nl,
write('3: Premalo slobodnog prostora na disku uzrokuje spor rad sustava, potrebno je očistiti nepotrebne datoteke ili defragmentriati hard disk'),
nl,
write('Probleme s performansama je moguće otkriti unutar task managera kombinacijom tipki Ctrl+Shift+Esc te u odjeljcima performance i tasks uvidjeti koji procesi troše najviše procesorske snage ili zauzimaju najviše RAM-a'),
nl.
operating_system :-
simptom(boot),
simptom(update),
simptom(registri),
write('Savjeti i prijedlozi:'),
nl,
write('1: •	Neuspješno pokretanje sustava: Računalo se ne može pokrenuti zbog oštećenih sistemskih datoteka, potrebno je izvršiti oporavak na raniju sliku verzije OS-a u kojem je bio stabilan'),
nl,
write('2: •	Ažuriranja sustava: Problemi uzrokovani neuspjelim ili nepotpunim ažuriranjima operativnog sustava'),
nl,
write('3: •	Greške u registru: Oštećene ili neispravne unose u registru uzrokuju nestabilnost sustava'),
nl,
write('Problemi s radom OS-a mogu se otkloniti vraćanjem na početne postavke, oporavkom na prethodnu stablinu verziju iz backupa'),
nl.
/* kako postaviti upit */
upit(Pitanje) :-
write('Prepoznajete li neke od sljedećih simptoma koji se vezuju uz vaš problem:'),
write(Pitanje),
write('? '),
read(Odgovor),
nl,
( (Odgovor == da ; Odgovor == d)
->
assert(da(Pitanje)) ;
assert(ne(Pitanje)), fail).
:- dynamic da/1,ne/1.

simptom(S) :-
 (da(S)
  ->
   true ;
 (ne(S)
  ->
   fail ;
 upit(S))).
/* undo all da/ne assertions*/
undo :- retract(da(_)),fail.
undo :- retract(ne(_)),fail.
undo.