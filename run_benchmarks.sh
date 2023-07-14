if ! [ -e results ]
then
  mkdir results
fi






storm_ex=storm/build/bin/storm
storm_dir=results/storm
if ! [ -e $storm_dir ]
then
  mkdir $storm_dir
fi
/usr/bin/time -v -o $storm_dir/busyRing4.time $storm_ex --prism benchmarks/busyRing4.prism -prop 'R{"r"}min=? [ S ]' > $storm_dir/busyRing4.log
/usr/bin/time -v -o $storm_dir/coin2.time $storm_ex --prism benchmarks/coin2.prism -prop 'R{"steps"}max=? [ S ]' -const K=5 > $storm_dir/coin2.log
/usr/bin/time -v -o $storm_dir/consensus.4.time $storm_ex --prism benchmarks/consensus.4.prism -prop 'R{"steps"}max=? [ S ]' -const K=10 > $storm_dir/consensus.4.log
/usr/bin/time -v -o $storm_dir/consensus.10.time $storm_ex --prism benchmarks/consensus.10.prism -prop 'R{"steps"}max=? [ S ]' -const K=5 > $storm_dir/consensus.10.log
/usr/bin/time -v -o $storm_dir/csma.2-4.time $storm_ex --prism benchmarks/csma.2-4.prism -prop 'R{"time"}max=? [ S ]' > $storm_dir/csma.2-4.log
/usr/bin/time -v -o $storm_dir/csma.4-6.time $storm_ex --prism benchmarks/csma.4-6.prism -prop 'R{"time"}max=? [ S ]' > $storm_dir/csma.4-6.log
/usr/bin/time -v -o $storm_dir/cs_nfail3.time $storm_ex --prism benchmarks/cs_nfail3.prism -prop 'R{"grants"}max=? [ S ]' > $storm_dir/cs_nfail.3.log
/usr/bin/time -v -o $storm_dir/eajs.500.time $storm_ex --prism benchmarks/eajs.500.prism -prop 'R{"energyLocal"}max=? [ S ]' > $storm_dir/eajs.500.log
/usr/bin/time -v -o $storm_dir/eajs.1000.time $storm_ex --prism benchmarks/eajs.1000.prism -prop 'R{"energyLocal"}max=? [ S ]' > $storm_dir/eajs.1000.log
/usr/bin/time -v -o $storm_dir/firewire.false.time $storm_ex --prism benchmarks/firewire.false.prism -prop 'R{"time_sending"}max=? [ S ]' -const deadline=20,delay=2 > $storm_dir/firewire.false.log
/usr/bin/time -v -o $storm_dir/ij.10.time $storm_ex --prism benchmarks/ij.10.prism -prop 'R{"default"}max=? [ S ]' > $storm_dir/ij.10.log
/usr/bin/time -v -o $storm_dir/investor.time $storm_ex --prism benchmarks/investor.prism -prop 'R{"payoff"}max=? [ S ]' > $storm_dir/investor.log
/usr/bin/time -v -o $storm_dir/largergrid.time $storm_ex --prism benchmarks/largergrid.prism -prop 'R{"default"}max=? [ S ]' > $storm_dir/largergrid.log
/usr/bin/time -v -o $storm_dir/mer.3.time $storm_ex --prism benchmarks/mer.3.prism -prop 'R{"grants"}max=? [ S ]' > $storm_dir/mer.3.log
/usr/bin/time -v -o $storm_dir/mer.4.time $storm_ex --prism benchmarks/mer.4.prism -prop 'R{"grants"}max=? [ S ]' > $storm_dir/mer.4.log
/usr/bin/time -v -o $storm_dir/pacman.10.time $storm_ex --prism benchmarks/pacman.10.prism -prop 'R{"default"}max=? [ S ]' > $storm_dir/pacman.10.log
/usr/bin/time -v -o $storm_dir/pacman.15.time $storm_ex --prism benchmarks/pacman.15.prism -prop 'R{"default"}max=? [ S ]' > $storm_dir/pacman.15.log
/usr/bin/time -v -o $storm_dir/pneuli-zuck.3.v1.time $storm_ex --prism benchmarks/pnueli-zuck.3.v1.prism -prop 'R{"live"}max=? [ S ]' > $storm_dir/pnueli-zuck.v1.log
/usr/bin/time -v -o $storm_dir/rabin.3.time $storm_ex --prism benchmarks/rabin.3.prism -prop 'R{"critical"}max=? [ S ]' > $storm_dir/rabin.3.log
/usr/bin/time -v -o $storm_dir/rabin.10.time $storm_ex --prism benchmarks/rabin.10.prism -prop 'R{"critical"}max=? [ S ]' > $storm_dir/rabin.10.log
/usr/bin/time -v -o $storm_dir/sensors.time $storm_ex --prism benchmarks/sensors.prism -prop 'R{"default"}max=? [ S ]' -const K=5 > $storm_dir/sensors.log
/usr/bin/time -v -o $storm_dir/virus.3.time $storm_ex --prism benchmarks/virus.3.prism -prop 'R{"attacks"}max=? [ S ]' > $storm_dir/virus.3.log
/usr/bin/time -v -o $storm_dir/wlan.3.time $storm_ex --prism benchmarks/wlan.3.prism -prop 'R{"collisions"}min=? [ S ]' -const COL=6 > $storm_dir/wlan.3.log
/usr/bin/time -v -o $storm_dir/wlan.6.time $storm_ex --prism benchmarks/wlan.6.prism -prop 'R{"collisions"}min=? [ S ]' -COL=6 > $storm_dir/wlan.6.log
/usr/bin/time -v -o $storm_dir/zeroconf.time $storm_ex --prism benchmarks/zeroconf.prism -prop 'R{"default"}max=? [ S ]' > $storm_dir/zeroconf.log




multigain_dir=results/multigain
if ! [ -e $multigain_dir ]
then
  mkdir $multigain_dir
fi
prism_ex=multigain2/prism-4.7-src/prism/bin/prism

gurobi_flag=''
if [ -e $GUROBI_HOME ]
then
 gurobi_flag=--gurobi
fi

/usr/bin/time -v -o $multigain_dir/busyRing4.time $prism_ex benchmarks/busyRing4.prism benchmarks/busyRing4.props $gurobi_flag > $multigain_dir/busyRing4.log
/usr/bin/time -v -o $multigain_dir/coin2.time $prism_ex benchmarks/coin2.prism benchmarks/coin2.props -const K=5 $gurobi_flag > $multigain_dir/coin2.log
/usr/bin/time -v -o $multigain_dir/consensus.4.time $prism_ex benchmarks/consensus.4.prism benchmarks/consensus.props -const K=10 $gurobi_flag > $multigain_dir/consensus4.log
/usr/bin/time -v -o $multigain_dir/consensus.10.time $prism_ex benchmarks/consensus.10.prism benchmarks/consensus.props -const K=5 $gurobi_flag > $multigain_dir/consensus.10.log
/usr/bin/time -v -o $multigain_dir/csma.2-4.time $prism_ex benchmarks/csma.2-4.prism benchmarks/csma.props $gurobi_flag > $multigain_dir/csma.2-4.log
/usr/bin/time -v -o $multigain_dir/csma.4-6.time $prism_ex benchmarks/csma.4-6.prism benchmarks/csma.props $gurobi_flag > $multigain_dir/csma.4-6.log
/usr/bin/time -v -o $multigain_dir/cs_nfail3.time $prism_ex benchmarks/cs_nfail3.prism benchmarks/cs_nfail.props $gurobi_flag > $multigain_dir/cs_nfail3.log
/usr/bin/time -v -o $multigain_dir/eajs.500.time $prism_ex benchmarks/eajs.500.prism benchmarks/eajs.props $gurobi_flag > $multigain_dir/eajs.500.log
/usr/bin/time -v -o $multigain_dir/eajs.1000.time $prism_ex benchmarks/eajs.1000.prism benchmarks/eajs.props $gurobi_flag > $multigain_dir/eajs.1000.log
/usr/bin/time -v -o $multigain_dir/firewire.time $prism_ex benchmarks/firewire.false.prism benchmarks/firewire.props -const deadline=20,delay=2 $gurobi_flag > $multigain_dir/firewire.false.log
/usr/bin/time -v -o $multigain_dir/ij.10.time $prism_ex benchmarks/ij.10.prism benchmarks/ij.props $gurobi_flag > $multigain_dir/ij.10.log
/usr/bin/time -v -o $multigain_dir/investor.time $prism_ex benchmarks/investor.prism benchmarks/investor.props $gurobi_flag > $multigain_dir/investor.log
/usr/bin/time -v -o $multigain_dir/largergrid.time $prism_ex benchmarks/largergrid.prism benchmarks/largergrid.props $gurobi_flag > $multigain_dir/largergrid.log
/usr/bin/time -v -o $multigain_dir/mer.3.time $prism_ex benchmarks/mer.3.prism benchmarks/mer.props $gurobi_flag > $multigain_dir/mer.3.log
/usr/bin/time -v -o $multigain_dir/mer.4.time $prism_ex benchmarks/mer.4.prism benchmarks/mer.props $gurobi_flag > $multigain_dir/mer.log
/usr/bin/time -v -o $multigain_dir/pacman.10.time $prism_ex benchmarks/pacman.10.prism benchmarks/pacman.props $gurobi_flag > $multigain_dir/pacman.10.log
/usr/bin/time -v -o $multigain_dir/pacman.15.time $prism_ex benchmarks/pacman.15.prism benchmarks/pacman.props $gurobi_flag > $multigain_dir/pacman.15.log
/usr/bin/time -v -o $multigain_dir/pnueli-zuck.3.v1.time $prism_ex benchmarks/pnueli-zuck.3.v1.prism benchmarks/pnueli-zuck.v1.props $gurobi_flag > $multigain_dir/pnueli-zuck.v1.log
/usr/bin/time -v -o $multigain_dir/rabin.3.time $prism_ex benchmarks/rabin.3.prism benchmarks/rabin.props $gurobi_flag > $multigain_dir/rabin.3.log
/usr/bin/time -v -o $multigain_dir/rabin.10.time $prism_ex benchmarks/rabin.10.prism benchmarks/rabin.props $gurobi_flag > $multigain_dir/rabin.10.log
/usr/bin/time -v -o $multigain_dir/sensors.time $prism_ex benchmarks/sensors.prism benchmarks/sensors.props -const K=5 $gurobi_flag > $multigain_dir/sensors.log
/usr/bin/time -v -o $multigain_dir/virus.3.time $prism_ex benchmarks/virus.3.prism benchmarks/virus.props $gurobi_flag > $multigain_dir/virus.3.log
/usr/bin/time -v -o $multigain_dir/wlan.3.time $prism_ex benchmarks/wlan.3.prism benchmarks/wlan.props -const COL=6 $gurobi_flag > $multigain_dir/wlan.3.log
/usr/bin/time -v -o $multigain_dir/wlan.6.time $prism_ex benchmarks/wlan.6.prism benchmarks/wlan.props -const COL=6 $gurobi_flag > $multigain_dir/wlan.6.log
/usr/bin/time -v -o $multigain_dir/zeroconf.time $prism_ex benchmarks/zeroconf.prism benchmarks/zeroconf.props $gurobi_flag > $multigain_dir/zeroconf.log







pet_ex=partial-exploration/build/distributions/partial-exploration-1.0/bin/partial-exploration
pet_dir=results/pet
if ! [ -e $pet_dir ]
then
  mkdir $pet_dir
fi

/usr/bin/time -v -o $pet_dir/busyRing4.time $pet_ex mean-payoff --model=benchmarks/busyRing4.prism --rewards=r --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/busyRing4.log
/usr/bin/time -v -o $pet_dir/coin2.time $pet_ex mean-payoff --model=benchmarks/coin2.prism --const=K=5 --rewards=steps --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/coin2.log
/usr/bin/time -v -o $pet_dir/consensus.4.time $pet_ex mean-payoff --model=benchmarks/consensus.4.prism --const=K=10 --rewards=steps --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/consensus.4.log
/usr/bin/time -v -o $pet_dir/consensus.10.time $pet_ex mean-payoff --model=benchmarks/consensus.10.prism --const=K=5 --rewards=steps --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/consensus.10.log
/usr/bin/time -v -o $pet_dir/csma.2-4.time $pet_ex mean-payoff --model=benchmarks/csma.2-4.prism --rewards=time --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/csma.2-4.log
/usr/bin/time -v -o $pet_dir/csma.4-6.time $pet_ex mean-payoff --model=benchmarks/csma.4-6.prism --rewards=time --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/csma.4-6.log
/usr/bin/time -v -o $pet_dir/cs_nfail3.time $pet_ex mean-payoff --model=benchmarks/cs_nfail3.prism --rewards=grants --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/cs_nfail.3.log
/usr/bin/time -v -o $pet_dir/eajs.500.time $pet_ex mean-payoff --model=benchmarks/eajs.500.prism --rewards=energyLocal --reward-min=0 --reward-max=5 --pretty-print > $pet_dir/eajs.500.log
/usr/bin/time -v -o $pet_dir/eajs.1000.time $pet_ex mean-payoff --model=benchmarks/eajs.1000.prism --rewards=energyLocal --reward-min=0 --reward-max=10 --pretty-print > $pet_dir/eajs.1000.log
/usr/bin/time -v -o $pet_dir/firewire.false.time $pet_ex mean-payoff --model=benchmarks/firewire.false.prism --const=deadline=20,delay=2 --rewards=time_sending --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/firewire.false.log
/usr/bin/time -v -o $pet_dir/ij.10.time $pet_ex mean-payoff --model=benchmarks/ij.10.prism --rewards=default --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/ij.10.log
/usr/bin/time -v -o $pet_dir/investor.time $pet_ex mean-payoff --model=benchmarks/investor.prism --rewards=payoff --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/investor.log
/usr/bin/time -v -o $pet_dir/largergrid.time $pet_ex mean-payoff --model=benchmarks/largergrid.prism --rewards=default --reward-min=-1 --reward-max=1 --pretty-print > $pet_dir/largergrid.log
/usr/bin/time -v -o $pet_dir/mer.3.time $pet_ex mean-payoff --model=benchmarks/mer.3.prism --rewards=grants --reward-min=0 --reward-max=2 --pretty-print > $pet_dir/mer.3.log
/usr/bin/time -v -o $pet_dir/mer.4.time $pet_ex mean-payoff --model=benchmarks/mer.4.prism --rewards=grants --reward-min=0 --reward-max=2 --pretty-print > $pet_dir/mer.4.log
/usr/bin/time -v -o $pet_dir/pacman.10.time $pet_ex mean-payoff --model=benchmarks/pacman.10.prism --rewards=default --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/pacman.10.log
/usr/bin/time -v -o $pet_dir/pacman.15.time $pet_ex mean-payoff --model=benchmarks/pacman.15.prism --rewards=default --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/pacman.15.log
/usr/bin/time -v -o $pet_dir/pnueli-zuck.3.v1.time $pet_ex mean-payoff --model=benchmarks/pnueli-zuck.3.v1.prism --rewards=live --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/pnueli-zuck.3.v1.log
/usr/bin/time -v -o $pet_dir/rabin.3.time $pet_ex mean-payoff --model=benchmarks/rabin.3.prism --rewards=critical --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/rabin.3.log
/usr/bin/time -v -o $pet_dir/rabin.10.time $pet_ex mean-payoff --model=benchmarks/rabin.10.prism --rewards=critical --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/rabin.10.log
/usr/bin/time -v -o $pet_dir/sensors.time $pet_ex mean-payoff --model=benchmarks/sensors.prism --const=K=5 --rewards=default --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/sensors.log
/usr/bin/time -v -o $pet_dir/virus.3.time $pet_ex mean-payoff --model=benchmarks/virus.3.prism --rewards=attacks --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/virus.3.log
/usr/bin/time -v -o $pet_dir/wlan.3.time $pet_ex mean-payoff --model=benchmarks/wlan.3.prism --const=COL=6 --rewards=collisions --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/wlan.3.log
/usr/bin/time -v -o $pet_dir/wlan.10.time $pet_ex mean-payoff --model=benchmarks/wlan.10.prism --const=COL=6 --rewards=collisions --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/wlan.10.log
/usr/bin/time -v -o $pet_dir/zeroconf.time $pet_ex mean-payoff --model=benchmarks/zeroconf.prism --rewards=default --reward-min=0 --reward-max=1 --pretty-print > $pet_dir/zeroconf.log









