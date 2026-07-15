(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_014.
Definition enc_14 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_14 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_14 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_14 : forall o : option nat, dec_14 (enc_14 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_14 : forall o : option nat, enc_14 o = size_14 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_14 : forall o : option nat, enc_14 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_014.

