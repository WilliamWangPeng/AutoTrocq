(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_022.
Definition enc_22 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_22 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_22 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_22 : forall o : option nat, dec_22 (enc_22 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_22 : forall o : option nat, enc_22 o = size_22 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_22 : forall o : option nat, enc_22 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_022.

