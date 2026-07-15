(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_025.
Definition enc_85 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_85 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_85 : forall o, dec_85 (enc_85 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_85 : forall o, enc_85 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_025.

