(* V64 robustness-matrix module *)
Module V64_REJECT_MISSING_CASE_007.
Definition enc_287 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Theorem bad_none_287 : forall n, enc_287 (Some n) = 0.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_MISSING_CASE_007.

