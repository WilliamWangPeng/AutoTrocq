(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_012.
Definition enc_12 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_12 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_12 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_12 : forall o : option nat, dec_12 (enc_12 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_12 : forall o : option nat, enc_12 o = size_12 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_12 : forall o : option nat, enc_12 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_012.

