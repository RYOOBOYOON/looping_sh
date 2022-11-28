#!/bin/bash

# export op=/stt_data/voice_data/
export op=converted_files/

for date in $op*

do

echo $date
echo ${date:(-8):6}

    if [ ${date:(-8):6} == "202209" ]

    then

        for files in $date/*


        do

        echo $files

            if [ -f $files/tts.txt ]
            
                then

                    export size=$(wc -c < $files/mic1.wav)

                    if [ $size -gt 1000 ]
                    
                        then

                            source dependencies/venv/bin/activate
                            for file in $files/*_rx.wav

                            do

                                export first=`echo $file | cut -d '/' -f4 | cut -d '_' -f1`
                                export sec=`echo $file | cut -d '/' -f4 | cut -d '_' -f2`

                                python3 tester/ClientMockup.py -d $files -r $first -s $sec

                                echo "확인"
                                
                            done

                        else

                            echo "size 부족"

                    fi

                else

                    echo "tts없음"
            
                fi

        done

    fi

done