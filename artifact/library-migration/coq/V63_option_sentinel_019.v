(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_019.
Definition enc_19 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_19 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_19 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_19 : forall o : option nat, dec_19 (enc_19 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_19 : forall o : option nat, enc_19 o = size_19 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_19 : forall o : option nat, enc_19 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_019.

