(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_030.
Definition enc_30 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_30 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_30 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_30 : forall o : option nat, dec_30 (enc_30 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_30 : forall o : option nat, enc_30 o = size_30 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_30 : forall o : option nat, enc_30 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_030.

