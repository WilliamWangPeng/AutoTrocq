(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_033.
Definition enc_33 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_33 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_33 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_33 : forall o : option nat, dec_33 (enc_33 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_33 : forall o : option nat, enc_33 o = size_33 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_33 : forall o : option nat, enc_33 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_033.

