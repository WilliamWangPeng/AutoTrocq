(* V64 robustness-matrix module *)
Module V64_REJECT_MISSING_CASE_009.
Definition enc_289 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Theorem bad_none_289 : forall n, enc_289 (Some n) = 0.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_MISSING_CASE_009.

