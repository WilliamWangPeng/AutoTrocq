(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_036.
Definition enc_96 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_96 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_96 : forall o, dec_96 (enc_96 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_96 : forall o, enc_96 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_036.

