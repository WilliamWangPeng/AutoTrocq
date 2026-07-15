(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_052.
Definition enc_52 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_52 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_52 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_52 : forall o : option nat, dec_52 (enc_52 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_52 : forall o : option nat, enc_52 o = size_52 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_52 : forall o : option nat, enc_52 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_052.

