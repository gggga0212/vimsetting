#!/bin/bash

PS3="Select your test plan: "

select lng in No7_peripheral_ae_pa No8_central_ae_sync No9_central_peripheral_ae_pa_sync Quit
do
    case $lng in
        "No7_peripheral_ae_pa")
            echo "$lng - that's what we're talking about";;
        "No8_central_ae_sync")
           echo "$lng - is your VM ready?";;
        "No9_central_peripheral_ae_pa_sync")
           echo "$lng - let's prepare for a lot of compilation";;
        "Quit")
           echo "We're done"
           break;;
        *)
           echo "Ooops";;
    esac
done
