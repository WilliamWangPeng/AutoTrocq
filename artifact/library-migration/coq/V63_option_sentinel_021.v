(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_021.
Definition enc_21 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_21 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_21 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_21 : forall o : option nat, dec_21 (enc_21 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_21 : forall o : option nat, enc_21 o = size_21 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_21 : forall o : option nat, enc_21 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_021.

