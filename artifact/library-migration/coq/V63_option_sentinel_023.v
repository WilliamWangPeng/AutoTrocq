(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_023.
Definition enc_23 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_23 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_23 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_23 : forall o : option nat, dec_23 (enc_23 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_23 : forall o : option nat, enc_23 o = size_23 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_23 : forall o : option nat, enc_23 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_023.

