(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_013.
Definition enc_13 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_13 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_13 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_13 : forall o : option nat, dec_13 (enc_13 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_13 : forall o : option nat, enc_13 o = size_13 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_13 : forall o : option nat, enc_13 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_013.

