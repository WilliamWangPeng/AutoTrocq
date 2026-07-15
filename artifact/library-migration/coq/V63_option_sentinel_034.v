(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_034.
Definition enc_34 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_34 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_34 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_34 : forall o : option nat, dec_34 (enc_34 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_34 : forall o : option nat, enc_34 o = size_34 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_34 : forall o : option nat, enc_34 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_034.

