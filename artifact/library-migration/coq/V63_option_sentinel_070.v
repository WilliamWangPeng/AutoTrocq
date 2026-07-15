(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_070.
Definition enc_70 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_70 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_70 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_70 : forall o : option nat, dec_70 (enc_70 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_70 : forall o : option nat, enc_70 o = size_70 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_70 : forall o : option nat, enc_70 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_070.

