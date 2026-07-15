(* V64 robustness-matrix module *)
Module V64_REJECT_MISSING_CASE_032.
Definition enc_312 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Theorem bad_none_312 : forall n, enc_312 (Some n) = 0.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_MISSING_CASE_032.

