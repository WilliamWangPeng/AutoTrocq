(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_009.
Definition enc_9 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_9 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_9 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_9 : forall o : option nat, dec_9 (enc_9 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_9 : forall o : option nat, enc_9 o = size_9 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_9 : forall o : option nat, enc_9 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_009.

