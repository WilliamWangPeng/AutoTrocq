(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_017.
Definition enc_77 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_77 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_77 : forall o, dec_77 (enc_77 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_77 : forall o, enc_77 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_017.

