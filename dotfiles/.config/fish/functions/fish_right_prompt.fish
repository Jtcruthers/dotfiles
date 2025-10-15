function fish_right_prompt
  set -l last_status $status

  # Prompt status only if it's not 0
  set -l stat
  if test $last_status -ne 0
      set stat (set_color red)"[$last_status]"(set_color normal)
      printf "%s " $stat
  end

    
    # Calculate command duration
    if test $CMD_DURATION
        set_color yellow

        # Format duration based on length
        if test $CMD_DURATION -gt 60000
            # Over a minute: show as "Xm Y.Zs"
            set -l minutes (math --scale=0 $CMD_DURATION / 60000)
            set -l seconds_with_ms (math --scale=1 "($CMD_DURATION % 60000) / 1000")
            printf "(%dm %ss) " $minutes $seconds_with_ms
        else 
            set -l seconds_with_ms (math --scale=3 "$CMD_DURATION / 1000")
            printf "(%ss) " $seconds_with_ms
        end
    end

    # Show current time
    set_color normal
    printf "[%s]" (date "+%H:%M:%S")
end
